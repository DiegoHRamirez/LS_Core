

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

def prompt(string)
  puts "=> #{string}"
end

def display_board(brd)
  system 'clear'
  puts "\n"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joiner(array, separator1 = ', ', separator2 = 'or')
  if array.size > 2
    last_num = array.pop
    "#{array.join(', ')}#{separator1}#{separator2} #{last_num}"
  elsif array.size > 1
    "#{array.join(' or ')}"
  else
    "#{array[0]}"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: " + joiner(empty_squares(brd), ', ', 'and')
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def take_the_win(line, board)
  if board.values_at(*line).count(COMPUTER_MARKER) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = take_the_win(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd)
      break if square
    end
  end

  if !square
    square = 5 if brd[5] == ' '
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  winner = false
  WINNING_LINES.each do |line|
    if (brd[line[0]] == brd[line[1]] &&
       brd[line[1]] == brd[line[2]]) &&
       brd[line[0]] != ' '

       winner = brd[line[0]] == PLAYER_MARKER ? 'Player' : 'Computer'
    end
  end
  winner
end

def someone_won?(brd)
  detect_winner(brd) != false
end

computer_wins = 0
player_wins = 0

prompt "Welcome to Tic Tac Toe! First to 5 wins is the champ!"
prompt "Enter your name to begin the game: "
user_name = gets.chomp

loop do
  board = initialize_board

  display_board(board)

  loop do
    display_board(board)

    prompt "#{user_name.capitalize}, it's your turn."
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    detect_winner(board) == 'Player' ? player_wins += 1 : computer_wins += 1
  else
    prompt "It's a tie!"
  end

  puts "\n"
  prompt "Computer Wins: #{computer_wins}"
  prompt "Player Wins: #{player_wins}"

  unless computer_wins == 5 || player_wins == 5
    prompt "Press any key to start the next round."
    continue_variable = gets.chomp
  else
    break
  end
end

final_winner = player_wins == 5 ? user_name : "Computer"
prompt "Congratulations #{final_winner}!"
prompt "Thanks for Playing."

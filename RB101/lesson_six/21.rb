def prompt(string)
  puts "=> #{string}"
end

def draw!(deck)
  rand_suit = deck.sample
  rand_suit.delete_at(rand(0..rand_suit.size - 1))
end

def set_player_cards(deck, hand)
  hand << draw!(deck)
  hand << draw!(deck)
end

def ace_values(cards, total)
  counter = cards.count('Ace')

  if counter == 1
    total + 11 <= 21 ? 11 : 1
  else
    ace_sum = total
    counter.times { ace_sum += ace_sum + 11 <= 21 ? 11 : 1 }
    ace_sum - total
  end
end

def sum_of_cards(hand)
  face_value_cards = hand.select { |card| card.to_s.to_i == card }
  sum = face_value_cards.sum

  string_cards = hand - face_value_cards
  string_cards.each { |card| sum += 10 unless card == 'Ace' }

  sum += ace_values(string_cards, sum) if string_cards.include?('Ace')
  sum
end

def bust?(hand)
  sum_of_cards(hand) <= 21
end

def print_player_cards(player_cards, player)
  temp_deck = player_cards.dup

  final_card = temp_deck.pop.to_s

  if temp_deck.size == 1
    print "\n#{player}'s cards: #{temp_deck.first} and " + final_card + "\n"
  else
    print "#{player} cards: "
    temp_deck.each { |card| print card.to_s + ', ' }
    print 'and ' + final_card.to_s + "\n"
  end
end

def print_sum(player_cards, player)
  prompt "Total of #{player}'s cards is #{sum_of_cards(player_cards)}"
  puts "\n"
end

def print_win_count(player, count)
  puts "#{player} Wins : #{count}"
end

player_wins = 0
dealer_wins = 0
player = nil

puts "Welcome to Twenty-One!\n\n"
prompt "Enter your name : "
player = gets.chomp.capitalize

loop do
  hearts = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  clovers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  diamonds = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  spades = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

  card_stack = [hearts, clovers, diamonds, spades]

  player_hand = []
  dealer_hand = []

  set_player_cards(card_stack, player_hand)
  set_player_cards(card_stack, dealer_hand)

  prompt "Dealer has: #{dealer_hand[0]} and unknown card"
  print_player_cards(player_hand, player)
  print_sum(player_hand, player)

  prompt "Your turn."

  player_status = 1
  loop do
    prompt "Type 'stay' or press any key to hit!"
    player_status = gets.chomp.downcase
    if player_status == 'stay'
      player_status = 1
      break
    end
    player_hand << draw!(card_stack)

    if !bust?(player_hand)
      prompt "#{player} drew a #{player_hand.last}"
      print_player_cards(player_hand, player)
      print_sum(player_hand, player)
      prompt "#{player} busted! Dealer Wins."
      player_status = 0
      break
    end

    prompt "#{player} drew a #{player_hand.last}"
    print_player_cards(player_hand, player)
    print_sum(player_hand, player)
  end

  dealer_status = 1
  unless player_status == 0
    while sum_of_cards(dealer_hand) < 17
      dealer_hand << draw!(card_stack)
      prompt "Dealer hit!"
      puts "Dealer drew a #{dealer_hand.last}"

      if !bust?(dealer_hand)
        print_player_cards(dealer_hand, "Dealer")
        print_sum(dealer_hand, "Dealer")

        prompt "Dealer busted! #{player} wins."
        dealer_status = 0
        break
      end

      print_player_cards(dealer_hand, "Dealer")
      print_sum(dealer_hand, "Dealer")
    end

    if dealer_status == 1
      puts "\nDealer stays."
      print_sum(dealer_hand, 'Dealer')
    end
  end

  p_sum = sum_of_cards(player_hand)
  d_sum = sum_of_cards(dealer_hand)

  if dealer_status == 1 && player_status == 1
    print_player_cards(player_hand, player)
    print_sum(player_hand, player)

    print_player_cards(dealer_hand, 'Dealer')
    print_sum(dealer_hand, "Dealer")

    if p_sum > d_sum
      prompt "#{player} wins!"
      player_wins += 1
    elsif p_sum == d_sum
      prompt "It's a tie."
    else
      prompt "Dealer wins!"
      dealer_wins += 1

    end
  end

  player_wins += 1 if dealer_status == 0 && player_status == 1
  dealer_wins += 1 if dealer_status == 1 && player_status == 0

  print_win_count(player, player_wins)
  print_win_count("Dealer", dealer_wins)

  break if player_wins == 5 || dealer_wins == 5

  prompt "Press any key to continue to the next round!"
  choice = gets.chomp.downcase
end

winner = player_wins > dealer_wins ? player : 'Dealer'
prompt "#{winner} is the final winner!"
prompt "Thanks for playing!"

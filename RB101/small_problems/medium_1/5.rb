=begin
 diamond(n)
  char_pos = []
  n.times {|n| char_pos << n if n.odd?}

  mid = (n/2.0).ceil
  1.upto(char_pos.size) do |n|
    puts "#{' ' * (mid-n)}#{'*' * (char_pos[n-1])}"
  end

  puts "#{'*' * n}"

  1.upto(char_pos.size) do |n|
    puts "#{' ' * (n)}#{'*' * char_pos.reverse[n-1]}"
  end
end
=end

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)




diamond(21)
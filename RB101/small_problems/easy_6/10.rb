=begin

=end

def triangle(num)
  num.times do |n|
    puts "#{' ' * (num - n)}#{'*' * (n + 1)}"
  end
end

triangle(9)


=begin
input positive integer
output string of 1s and 0s, whose length matches the integer passed
=end

def stringy(integer)
  string = ""

  integer.times do |count|
    count.even? ? string << '1' : string << '0'
  end

  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
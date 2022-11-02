=begin
takes a positive integer
outputs a list of the digits in the number
=end

def digit_list(number)
  number = number.to_s.split("").map {|num| num.to_i }
end

p digit_list(12345) == [1, 2, 3, 4, 5]
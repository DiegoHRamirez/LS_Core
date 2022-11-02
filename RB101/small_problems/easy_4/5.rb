=begin
input: number
output: sum of mulltiples of 3 or 5 that lie between 1 and the inputed number
get input
calculate all multiple of 3 and 5 that lie between 1 and input
compute the sum of all multiple
=end

def multisum(number)
  multiples = (1..number).to_a.select { |num| num % 3 == 0 || num % 5  == 0}
  multiples.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

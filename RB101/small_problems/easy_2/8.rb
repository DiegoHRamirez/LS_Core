=begin
input: integer greater than 0, and if want sto determine the sum or product of all numbers between 1 and input integer
output: sum of integers between 1 and entered number if desired
=end
def prompt(string)
  puts ">> #{string}"
end

def compute_sum(number)
  (1..number).reduce(:+)
end

def compute_product(number)
  (1..number).reduce(:*)
end

loop do
  prompt "Please enter an integer greater than 0:"
  integer = gets.chomp.to_i

  prompt "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase

  sum_or_product = nil

  if operation == 'p'
    sum_or_product = compute_product(integer)
    operation = 'product'
  else
    sum_or_product = compute_sum(integer)
    operation = 'sum'
  end

  puts "The #{operation} of the integers between 1 and #{integer} is #{sum_or_product}."

  prompt "Would you like to continue (y/n)"
  user_input = gets.chomp.downcase
  break if user_input == 'n'
end
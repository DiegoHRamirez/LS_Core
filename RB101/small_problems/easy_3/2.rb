=begin
input: 2 positive integers
outputs: results of +,-,*,/, remainder, and power operations on both numbers
=end
def prompt(string)
  puts "==> #{string}"
end

numbers = []

prompt "Enter the first number:"
first_number = gets.chomp.to_i
numbers << first_number

prompt "Enter the second number:"
second_number = gets.chomp.to_i
numbers << second_number

prompt "#{first_number} + #{second_number} = #{numbers.reduce(:+)}"
prompt "#{first_number} - #{second_number} = #{numbers.reduce(:-)}"
prompt "#{first_number} * #{second_number} = #{numbers.reduce(:*)}"
prompt "#{first_number} / #{second_number} = #{numbers.reduce(:/)}"
prompt "#{first_number} % #{second_number} = #{numbers.reduce(:%)}"
prompt "#{first_number} ** #{second_number} = #{numbers.reduce(:**)}"

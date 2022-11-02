=begin
input: 6 numbers
output: prints a message that describes whether or not the 5th number eppears amongst the first 5 numbers
=end

def prompt(string)
  puts "==> #{string}"
end

def num_ask(number)
case number
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
end

end

user_input = []
5.times do |num|
  prompt "Enter the #{num + 1}#{num_ask(num + 1)} number:"
  number = gets.chomp.to_i
  user_input << number
end

prompt "Enter the last number:"
final_number = gets.chomp.to_i
if user_input.include?(final_number)
  puts "The number #{final_number} appears in #{user_input}."
else
  puts "The number #{final_number} does not appear in #{user_input}."
end


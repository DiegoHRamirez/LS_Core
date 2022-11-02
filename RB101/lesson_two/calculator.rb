def addition(num1, num2)
  num1 + num2
end

def subtraction(num1, num2)
  num1 - num2
end

def multiplication(num1, num2)
  num1 * num2
end

def division(num1, num2)
  num1 / num2
end

def valid_number?(number)
  if number.to_f.real? && number.to_i
    true
  else 
    false
  end
end

number_one = 'nil'
number_two = 'nil'

loop do  
  puts "Type in a number"
  number_one = Kernel.gets().chomp()
  if valid_number?(number_one) == false
    puts "That's not a valid number"
  else 
    break
  end  
end

loop do
  puts "Enter another number"
  number_two = Kernel.gets().chomp().to_f()
  if valid_number?(number_two) == false
    puts "Enter a real number"
  elsif valid_number?(number_two) && number_two == 0
    puts "If using 0 as a seocnd number do not choose divide. Type 'redo' to choose another number or 'ok' to continue"
    user_choice = Kernel.gets().chomp().downcase()
    break unless user_choice == 'redo'
  else
    break
  end
end

loop do
  puts "What would you like to do to these numbers? (Add, Subtract, Multiply, or Divide)"
  operation = Kernel.gets().chomp().downcase()
  
  case operation
  when 'add' 
    puts addition(number_one, number_two)
    break
  when 'subtract'
    puts subtraction(number_one, number_two)
    break
  when 'multiply'
    puts multiplication(number_one, number_two)
    break
  when 'divide'
    if number_two == 0
      puts "cannot divide a number by 0. Undefined"
      next
    else
      puts division(number_one, number_two)
      break
    end
  else
    puts "Enter a valid operation: Add, Subtract, Multiply, or Divide"
  end
end




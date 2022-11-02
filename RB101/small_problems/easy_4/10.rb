DIGITS = ('0'..'9').to_a

def integer_to_string_two(number)
  result = ''
  loop do
    remainder = number % 10
    number /= 10
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end



def signed_integer_to_string(int)
  if int > 0
    '+' + integer_to_string_two(int)
  elsif int < 0
    '-' + integer_to_string_two(int * -1)
  else
    '0'
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'



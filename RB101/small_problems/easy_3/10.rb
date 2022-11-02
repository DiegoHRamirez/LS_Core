=begin
input: integer
output: boolean value
true if number reads same backwards and forwards
=end

def palindromic_number?(number)
  number = number.to_s
  number == number.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
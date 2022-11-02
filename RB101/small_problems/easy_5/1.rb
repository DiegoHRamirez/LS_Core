=begin
Method determines and returns the ASCII string value of a string that is passed in as ana argument
THe ASCII string value is the sum of the ASCII values of every character in the string.
use string#ord to determine the value of a character

input: string
output: integer

the integer is the ASCII string value = sum of ASCII values for every character in the string.
-convert the string into an arrry
-iterate over the elements, and determine the ascII value of each element
-add the value of each element to a running count
-return the running count
=end

def ascii_value(string)
  value = 0
  string.chars.each do |char|
    value += char.ord
  end
  value
end

p ascii_value('Launch School') == 1251
p ascii_value('') == 0

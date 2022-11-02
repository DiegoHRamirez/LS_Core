=begin
input: two strings
output: outputs the concatenation of the shorter string, longer strong, and shorter string
determines the longest of the two
=end

def short_long_short(string_one, string_two)
  if string_one.size > string_two.size
    string_two + string_one + string_two
  else
    string_one + string_two + string_one
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"


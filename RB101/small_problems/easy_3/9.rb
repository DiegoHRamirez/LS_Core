=begin
input: string
output: boolean
string should be equal to itself in reverse
and be case-insensitive & it should ignore all non-alphanumeric characters
=end
def delete_non_alphanumeric(string)
  alpha_array = ('a'..'z').to_a + ('0'..'9').to_a
  string.chars.select { |char| alpha_array.include?(char) }
end

def real_palindrome?(string)
  string = delete_non_alphanumeric(string.downcase)
  string == string.reverse
end

p delete_non_alphanumeric('123ab321')


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false



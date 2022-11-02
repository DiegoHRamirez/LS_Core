=begin
input: array of strings
output: new array with vowels removed
=end


def remove_vowels(string)
  string.each_with_object([]) do |word, no_vowels|
    word_no_vowel = ''
    word.each_char do |char|
      word_no_vowel << char unless 'aeiouAEIOU'.include?(char)
    end
    no_vowels << word_no_vowel
  end
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
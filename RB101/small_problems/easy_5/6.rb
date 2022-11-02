=begin
returns string with non-alphabetic characters replaced by spaces
also, if more than one non alpha characters occur in a row,
there should only be one space in place of the row of non-alphabetic characters.

input: string with no alphabetic characters
output: string with only alphabetic characters, replacing the non-alphabetic characterrs with spaces
=end
LETTERS = ('a'..'z').to_a
def cleanup_efficient(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end


def na_row_size(string, counter)
  size = 1
  loop do
    counter += 1
    next_char = string[counter]
    break if LETTERS.include?(next_char) || counter >= string.size
    size += 1
  end
  size
end

def cleanup(string)
  clean_string = ''
  counter = 0
  loop do
    break if counter >= string.size
    current_char = string[counter]
    unless LETTERS.include?(current_char)
      counter += na_row_size(string, counter)
      clean_string << ' '
      next
    end
    clean_string << current_char
    counter += 1
  end

  string.chars.map do |char|


  clean_string
end

p cleanup("---what's my +*& line?") == ' what s my line '

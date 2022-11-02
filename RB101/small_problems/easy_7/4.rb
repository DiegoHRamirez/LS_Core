def swapcase(string)
  new_str = ''
  string.split.each do |word|
    word.chars.each do |char|
      ('a'..'z').to_a.include?(char) ? new_str << char.upcase : new_str << char.downcase
    end
    new_str << ' ' unless string.split.last == word
  end

  new_str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
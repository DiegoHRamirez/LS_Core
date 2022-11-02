def titleize(string)
  capitalized = string.split.each { |word| word[0].upcase! }
  capitalized.join(' ' )
end

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end



words = "the flintstones rock"

p titleize(words)
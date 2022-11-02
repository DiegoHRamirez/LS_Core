statement = "The Flintstones Rock"

character_count = {}

statement.chars.each do |letter|
  character_count[letter] = statement.count(letter) unless letter == ' '
end

p character_count
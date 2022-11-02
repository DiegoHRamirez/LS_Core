=begin
input: word or multiple words
output: number of characters no spaces
=end

print "Please write word or multiple words: "
word = gets.chomp

number_of_characters = word.split.join.size
puts "There are #{number_of_characters} characters in \"#{word}\"."

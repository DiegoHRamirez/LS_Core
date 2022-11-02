=begin
input: name
out: greeting with string interpolation
=end

print "What is your name? "
name = gets.chomp

if name.include?('!')
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end


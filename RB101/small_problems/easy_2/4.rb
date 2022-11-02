=begin
input: age
input: age to retire

out: age to retire, years left of work
=end
CURRENT_YEAR = Time.now.year

print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
age_to_retire = gets.chomp.to_i

years_left = age_to_retire - age
final_year = CURRENT_YEAR + years_left

puts "It's #{CURRENT_YEAR}. You will retire in #{final_year}."
puts "You only have #{years_left} years of work to go!"


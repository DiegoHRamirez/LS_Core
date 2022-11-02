=begin
input bill amount and tip rate
output tip and total amount of bill
compute tip
=end

puts "What is the bill? "
bill_amount = gets.chomp.to_f.round(2)
puts "What is the tip percentage? "
tip_percentage = gets.chomp.to_f / 100

tip = bill_amount * tip_percentage
bill = bill_amount + tip

puts  "The tip is $#{tip}"
puts "The total is $#{bill}"

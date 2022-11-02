def dot_separated_ip_address?(input_string)
  return false if input_string.count('.') != 3
  dot_separated_words = input_string.split(".")

  dot_separated_words.map! { |num| num.to_i }
  dot_separated_words.each do |num|
    return false if !(num >= 0 && num <= 255)
  end
  true
end


puts "enter an ip"
ip_address = gets.chomp

p "This ip number is #{dot_separated_ip_address?(ip_address)}"


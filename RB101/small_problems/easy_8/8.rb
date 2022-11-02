def double_consonants(string)
  consonants = ('a'..'z').to_a
  consonants = consonants.delete_if { |char| %(a e i o u).include?(char.downcase)}

  string.each_char.with_object('') do |char, str|
     consonants.include?(char.downcase) ? str << char << char : str << char
  end
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
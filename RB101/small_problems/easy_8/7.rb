def repeater(string)
  string.each_char.with_object('') do |char, arr|
    arr << char << char
  end
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
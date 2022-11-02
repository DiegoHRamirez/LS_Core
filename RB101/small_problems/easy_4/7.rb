
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  numbers = string.chars.map do |char|
    MAIN[char]
  end
  final_num = 0
  numbers.each do |num|
    final_num = 10 * final_num + num
  end
  final_num
end

def hexadecimal_to_integer(string)
  digits = string.downcase.chars.map {|hex| HEX_KEY[hex]}
  hexadecimal = 0

  digits.each do |num|
    hexadecimal = 16 * hexadecimal + num
  end
  hexadecimal

end

hexadecimal_strings = ('0'..'9').to_a + ('a'..'f').to_a
counter = 0
HEX_KEY = hexadecimal_strings.each_with_object({}) do |char, hash|
            hash[char] = counter
            counter += 1
          end


p hexadecimal_to_integer('4D9f')

p string_to_integer('1451')

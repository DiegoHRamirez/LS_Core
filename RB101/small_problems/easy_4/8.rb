DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}


def string_to_integer(string)

  numbers = string.chars.map { |char| DIGITS[char] }

  final_num = 0
  numbers.each do |num|
    final_num = (10 * final_num + num) unless num != num.to_s.to_i
  end

  final_num
end

def string_to_signed_integer(string_num)
 string_num.include?('-') ? string_to_integer(string_num) * -1 : string_to_integer(string_num)
end

p string_to_signed_integer('-4321') == -4321
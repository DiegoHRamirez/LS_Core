
number_string = ('0'..'9').to_a
count = 0
HASH_KEY =
  number_string.each_with_object({}) do |num_string, hash|
    hash[count] = num_string
    count += 1
  end


def get_num_size(int)
  size = 0
  tens_place_divisor = 1
  loop do
    int / tens_place_divisor == 0 ? break : size += 1
    tens_place_divisor *= 10
  end
  size
end

def integer_to_string(int)
  string_num = ''
  count = get_num_size(int)

  count.times do
    current_digit = int % 10
    string_num.prepend(HASH_KEY[current_digit])
    int /= 10
  end

  string_num << '0' if count == 0
  string_num
end

=begin
much easier
def integer_to_string_two(int)
  result = ''
  loop do
    remainder = number % 10
    number /= 10
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end
=end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

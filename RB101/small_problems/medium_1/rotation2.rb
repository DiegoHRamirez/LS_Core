def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, rotations)
  num_array = number.to_s.chars
  rotated_digits = rotate_array(num_array.pop(rotations))
  num_array = num_array + rotated_digits
  num_array.join.to_i
end
p rotate_rightmost_digits(735291, 3) == 735912


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912

p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

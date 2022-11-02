def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, rotations)
  num_array = number.to_s.chars
  rotated_digits = rotate_array(num_array.pop(rotations))
  num_array = num_array + rotated_digits
  num_array.join.to_i
end

def max_rotation(int)
  rotate = rotate_array(int.to_s.split(''))
  locked_digits = rotate.shift

  until rotate.empty?
    rotate = rotate_array(rotate)
    locked_digits << rotate.shift
  end

  locked_digits.to_i
end




p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(735291) == 321579










=begin
def max_rotation(int)
  num_array = int.to_s.split('')
  num_array = rotate_array(num_array)

  rotated_array = num_array[1..-1]


  until rotated_array.empty?
    rotated_array = rotate_rightmost_digits(rotated_array, rotated_array.size - 1)
    num_array << rotated_array.shift
  end

  num_array.join.to_i
end

=end


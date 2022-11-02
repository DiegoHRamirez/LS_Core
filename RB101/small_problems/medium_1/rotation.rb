=begin
write a method that rotates an array by moving the element at index 0 to the end of the array.
The original array should not be modified.

take the last value of the array,
append it to the end of the array
return a new array.
=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

a = [1, 2, 3]
p rotate_array(a)
p a
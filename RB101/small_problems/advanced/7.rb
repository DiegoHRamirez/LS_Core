def merge(arr1, arr2)
  new_arr = []
  arr_one, arr_two = arr1.map { |num| num }, arr2.map { |num| num }

  until arr_one.empty? || arr_two.empty?
    new_arr << (arr_one.first < arr_two.first ? arr_one.shift : arr_two.shift)
  end

  new_arr + arr_one + arr_two
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

=begin
def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1)
end


The method 'merge' is defined with keywords 'def' and 'end' between lines 22 and 34.
When merge is called and passed in two array objects are arguments, they get assigned to
local variables array1 and array 2.
On line 23, variable 'index2' is initialized and assigned to integer object '0'
On line 24, the variable 'result' is initialized and assigned to array object '[]'

On line 26, the array#each method is called on local variable array1 and passed a 'do..end' block that acts as
an argument from line 26 to 32. Each element in array1 is passed into the block and assigned to the local
variable 'value'.
On line 27, the 'while' loop method is invoked and iterates as long as the outer scope variable 'index2'
is less than the number of elements in array2 AND the element at integer 'index2' of 'array2' is less than
or equal to the local variable value, which represents the current element from array1 being passed
into the block.
within the while loop the element at index2 of array2 is appended to the result array.
The index2 outer scope variable is reassigned to the sum of itself and one.

on line 31, the 'value' representing the current element from array1 is appended to the result array.

On line 34, the array#concat method is called on the 'result' array and passed in as an argument the return value of
calling the #[] method on 'array2' with range 'index2..-1' passed in as an argument. Returns the object it was called on
and the method mutates the caller.
=end


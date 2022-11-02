=begin
sort an array of passed value using merge sort
array contains only one type of data
data is either all #s or strings
merge sort
-recursive (calls on itself),
-breaks down the array elements into nested sub_arrays
-recombines the nested sub_arrays in sorted order

-return when the array size == 1
-call on the merge_sort method
  -continuously split the array
  -continuously merge the array under certain conditions

=end
def merge(arr1, arr2)
  new_arr = []
  arr_one, arr_two = arr1.map { |num| num }, arr2.map { |num| num }

  until arr_one.empty? || arr_two.empty?
    new_arr << (arr_one.first < arr_two.first ? arr_one.shift : arr_two.shift)
  end

  new_arr + arr_one + arr_two
end

def merge_sort(array)
  return array if array.size == 1

  sub_arr1 = array[0...array.size/2]
  sub_arr2 = array[array.size / 2...array.size]

  sub_arr1 = merge_sort(sub_arr1)
  sub_arr2 = merge_sort(sub_arr2)

  merge(sub_arr1, sub_arr2)
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]























def merge_sort(array)
  return array if array.size == 1

  sub_array1 = array[0...array.size / 2]
  sub_array2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end


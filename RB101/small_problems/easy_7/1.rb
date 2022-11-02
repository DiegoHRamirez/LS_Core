def interleave(arr1, arr2)
  new_arr = []

  arr1.size.times do |n|
    new_arr << arr1[n] << arr2[n]
  end

  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

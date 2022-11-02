def add_arrays(ary1, ary2)
  count = 0
  new_array = []
  while count < ary1.size
    new_array << ary1[count]
    new_array << ary2[count]
    count += 1
  end
  return new_array
end

array1 = [1, 2, 3]
array2 = [4, 5, 6]

p add_arrays(array1, array2)
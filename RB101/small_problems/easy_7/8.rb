def multiply_list(arr1, arr2)
  arr1.map.with_index { |el, idx| el * arr2[idx] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
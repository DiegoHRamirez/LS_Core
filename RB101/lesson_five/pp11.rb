arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |sub_array|
         sub_array.reject {|num| num % 3 != 0 }
       end

p arr2
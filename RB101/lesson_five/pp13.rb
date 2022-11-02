arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]



arr2 = arr.sort_by do |sub_arry|
        sub_arry.select do |num|
          num.odd?
        end
       end
p arr2


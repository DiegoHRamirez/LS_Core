def buy_fruit(arr)
  arr.uniq.each_with_object([]) do |sub_arr, new_arr|
    fruit_count = sub_arr[-1]
    fruit_count.times {new_arr << sub_arr[0]}
  end
end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])

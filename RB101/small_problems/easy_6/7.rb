
def halvsies(arr)
  arr1 = arr.slice(0, (arr.size/2.0).ceil)
  arr2 = arr.slice((arr.size/2.0).ceil, arr.size/2)
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
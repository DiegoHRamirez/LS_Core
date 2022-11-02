array1 = [1, 2, 3]
array2 = [4, 5, 6]

iterator = 0 
new_array = []
count = 0

while iterator < 3
  new_array << array1[iterator]
  new_array << array2[iterator]
  iterator += 1
end

p new_array
  
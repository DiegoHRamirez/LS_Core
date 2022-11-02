=begin

The value of a did not change because we are not referencing a.
arr[0] += 2 modifies the array arr, not a. In effect we are assigning a new object
at the index of the array so instead of arr[0] containing a, it now contains 4

The value of b did change because b is an arry and we are modifying that array
by assigning a new value at index 0 of that array



a = 2

b = [3, 8]



=end

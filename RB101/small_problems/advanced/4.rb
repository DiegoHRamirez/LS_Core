=begin
-Iterate over each element in the nested array
-Iterate over each element in the column array
-Append the 1st element from every 'column' array to the 'row' array
=after iterating over each element in the 'column' array, iterate over the next 'column' array
-after iterating over every 'column' array, append the 'row' array to the 'transposed' array
=iterate until all the 'column' arrays are empty.
-return the 'transpose array'
=end


def transpose(matrix)
  transposed = []

  matrix[0].size.times do |column_idx|
    transposed << matrix.map { |subm| subm[column_idx] }
  end

  transposed
end



p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]


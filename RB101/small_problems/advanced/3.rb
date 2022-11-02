
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

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
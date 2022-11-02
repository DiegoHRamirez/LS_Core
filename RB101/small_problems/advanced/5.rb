
def transpose(matrix)
  transposed = []
  matrix[0].size.times do |column_idx|
    transposed << matrix.map { |subm| subm[column_idx] }
  end
  transposed
end

def rotate90(matrix)
  column_matrix = transpose(matrix)
  column_matrix.map { |col| col.reverse }
end

def rotate(matrix, degrees)
  column_matrix = matrix
  rotations = degrees / 90

  rotations.times do |n|
    column_matrix = transpose(column_matrix)
    column_matrix.map! { |col| col.reverse }
  end

  column_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p rotate(matrix2, 360)


new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix2
p new_matrix3

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == rotate(matrix2, 360)
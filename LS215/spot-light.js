/*
------------ **Explicit Requirements** -------------
Given a grid of numbers, return a grid of the Spotlight Sum of each number.

The spotlight sum can be defined as the total of all numbers immediately surrounding the
number on the grid, including the number in the total.

Rules:
spotlight sum: the total of all numbers surrounding the number on the grid, including the number in the total


Inputs: an array of nested subarrays (matrix)

Output:
------------ **Implicit Requirements** -------------
                  z[0]                 z[1]                    z[1]
zzz - z -> z0 + z1 + y0 + y1 | y row sum + sum of z row | z1 + y1 + z2 + y2
yyy - y -> 0 col sum + 1 col sum |  sum of of all rows  | sum of col 2 + sum of col 1
iii - i -> i0 + + i1 + y0 + y1 | y row sum + sum of i row | i1 + y1 + i2 + y2


------------- **Clarifying Questions** -------------

------------ Examples/Test Cases/Edge's ------------

[
  [1, 2, 3], --> [12, 21,  16]  0 -> 1, 3, 4    | 2(1) = 1 -> 0, 2, 3, 4, 5 | 3(2) => 1, 3, 5
  [4, 5, 6],      12, 21,       + 1, +,  |
  [7, 8, 9]
]

[
  [2, 6, 1, 3, 7],  21, 31, 28
  [8, 5, 9, 4, 0]
]

zzzzz - z -> z0 + z1 + y0 + y1 | col{1] + col[2] + col [3} | | z1 + y1 + z2 + y2
yyyyy - y -> 0 col sum + 1 col sum |  sum of of all rows  | sum of col 2 + sum of col 1

------------------ Data Structure ------------------
arra
-------------------- Algorithm ---------------------
transformt the arr, at each arr
  - reduce the number to the sum of its surrounding components
return the transformed arra, with each num transformed to a reduced sum

lower:

**** helper functions ****
spotSum(idx of the row where the num sits, arr)
- reduce the number to the sum of its surrounding components
  - filter the arr to the rows, idx - 1, idx + 1,
  - filter the rows arrr to the elements in the row with idx === idx || idx + 1 || idx - 1;
  - arr of relevant surround components, reduce it, take the sum return the sum
return the sum

---------------------- Notes -----------------------

*/




function spotlightMap(matrix) {
  return matrix.map((row, rowIdx) => row.map((num, colIdx) => spotSum(rowIdx, colIdx, matrix)));

  function spotSum(rowIdx, colIdx, matrix) {
    let rows =  matrix.filter((row, idx) => nearRow(idx, rowIdx));
    let nearby = rows.map(row => row.filter((_, idx) => nearCol(idx, colIdx)));
    return nearby.reduce((sum, row) => sum + row.reduce((sum2, num) => sum2 + num), 0);
  }

  function nearRow (idx, rowIdx) {
    return idx === rowIdx || idx === rowIdx + 1 || idx === rowIdx - 1
  }

  function nearCol(idx, colIdx) {
    return idx === colIdx || idx === colIdx + 1 || idx === colIdx - 1
  }
}



let matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

console.log(spotlightMap([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
])) //➞ [
// //   [12, 21, 16],
// //   [27, 45, 33],
// //   [24, 39, 28]
// // ]


console.log(spotlightMap([
  [2, 6, 1, 3, 7],
  [8, 5, 9, 4, 0]
])) //➞ [
// //   [21, 31, 28, 24, 14],
// //   [21, 31, 28, 24, 14]
// // ]


// spotlightMap([[3]]) //➞ [[3]]
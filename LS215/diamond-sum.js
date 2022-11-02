/*
explicit:
diamond sum-

input: an array of nested arrays
array represetns a grid
n is always odd

output:
return the diamond

implicit:


Given an nxn grid of consecutive numbers, return the grid's Diamond Sum. The diamond sum is defined as the sum of the numbers making up the diagonals between adjacent sides.

Examples
diamondSum(1) ➞ 1

[1]
diamondSum(3) ➞ 20


2 + 4 + 6 + 8

3 - 3 = 0 / 2
[
  [1, _, 3],
  [_, 5, _],
  [7, _, 9]
]

// The numbers behind the underscores make up the Diamond Sum.
// 2 + 4 + 6 + 8 = 20
diamondSum(5) ➞ 104
d(9)
9 - 3 = 6 / 2 = 3


5 - 3 = 2 / 2 = 1
x

m

x
[
  [1, 2, _, 4, 5],
  [6, _, 8, _, 10],
  [_, 12, 13, 14, _],
  [16, _, 18, _, 20],
  [21, 22, _, 24, 25]
]
implicit:
the values that are summed,
to make the arra of relevant cols
  - midpoint,
  - same midpoint
while theres more than 1 element arr of relevant cols
  - penultimate element add 1, push it the arr
  - final element subtract 1 push it the arr.

arr = reverse the arr,

[2] - midpoint,  truncation of the integer provided / 2
flooring 5 / 2 = 2
[1, 3]

[2, 1, 3]
[ 2] -> add to this array 2 + 1, 2 - 1
[2, 3, 1]


[0, 4] - 1st last elements


[3, 1, 2]

[1, 3]
[2]

d(9)

9
3
x

m

x



[4] + (4 + 1) << (4 - 1)
4, 5, 3,
6, 2,
4, 5, 3, 6, 2
7, 1
4, 5, 3, 6, 2, 7, 1
-----
col = 0, last idx 8

5 - 2 = 3  - 1 = 2
[
  [1, 2, _, 4, 5],
  [6, _, 8 _, 10],,
  [_, 12, 13, 14, _],
  [16, _, 18, _, 20],
  [21, 22, _, 24, 25]
]

// 3 + 7 + 9 + 11 + 15 + 17 + 19 + 23 = 104
Notes
n is always an odd number.
Bonus points for solving it mathematically!

data strcture: arr

algorithm:
define a midpoint 5 / 2 , - 2.
endpoints = 0, integer provided - 1
  0, 4
make an array of the relevant cols, have on element is the midpoint

define the next elements = midpoint + 1, midpoint - 1
1, 3
[2, 1, 3]

loop while the next elements don't equal the endpoints
  - add the next elements to the relevanCols
  next = elements
      - relevantCols[penultimate] + 1,
      - relevantCols[size of relvCols - 1] - 1



slice releavantCols starting from idx 1, remove the 1st
each pair of consecutive integer represent sthe relevant
colNumbers

gridSize - 3 / 2 = the number rows - the number iterate over arr

declare a a sum initialize it to 0
max = 5 - 3 / 2 = 1

topHalf =
slice the matrix (1, 1 + max)
slice one row
[6, _, 8 _, 10]

max = 3
diamond(9)
topHalfRows = slice te matrix(1, 1 + max)
3 rows




itertate over the topHalfROws, idx
  increment the sum by value from the nested arr at idx curentIDX  = relavantCols[idx + 1]
  increment the sum by the value from the nest arr at idx CurrentIDX + 1

  [3, 1] - relevantCol
[[16, _, 18, _, 20]]
row of matrix at idx 2
reverse arr of relevantCols
bottomHalfRows = slicing the matrix(midpoint + 1, midpoint + 1 max)
iteate over the bottomHalfRows
  increment the sum by the value at idx
    - relevantCols[currentIDX] -
  increment the sum by the val from nestedArr at idx currentIdx + 1


[} -

add to the sum the end rows (0, 7), element at idx midpoint of the row

add to the sumthe the end elements at the mid row (
  - the row at index midpoint, first element from elemen, last element

helper:(topHalf or bottomHalfRows, relevantCols) -
declare a sum
iterate over the given arr containing the rows from the matrix
  itertate over the topHalfROws, idx
    increment the sum by value from the nested arr at idx curentIDX  = relavantCols[idx + 1]
    increment the sum by the value from the nest arr at idx CurrentIDX + 1
return sum

// [[1, 4, 3] , [1, 2, 4]], [2, 1, ],


*/

/*
algorithm:
define a midpoint 5 / 2 , - 2.
endpoints = 0, integer provided - 1
  0, 4
make an array of the relevant cols, have on element is the midpoint

define the next elements = midpoint + 1, midpoint - 1
1, 3
[2, 1, 3]

loop while the next elements don't equal the endpoints
  - add the next elements to the relevanCols
  next = elements
      - relevantCols[penultimate] + 1,
      - relevantCols[size of relvCols - 1] - 1



slice releavantCols starting from idx 1, remove the 1st
each pair of consecutive integer represent sthe relevant
colNumbers

gridSize - 3 / 2 = the number rows - the number iterate over arr

declare a a sum initialize it to 0
max = 5 - 3 / 2 = 1

topHalf =
slice the matrix (1, 1 + max)
slice one row
[6, _, 8 _, 10]

max = 3
diamond(9)
topHalfRows = slice te matrix(1, 1 + max)
3 rows




itertate over the topHalfROws, idx
  increment the sum by value from the nested arr at idx curentIDX  = relavantCols[idx + 1]
  increment the sum by the value from the nest arr at idx CurrentIDX + 1

  [3, 1] - relevantCol
[[16, _, 18, _, 20]]
row of matrix at idx 2
reverse arr of relevantCols
bottomHalfRows = slicing the matrix(midpoint + 1, midpoint + 1 max)
iteate over the bottomHalfRows
  increment the sum by the value at idx
    - relevantCols[currentIDX] -
  increment the sum by the val from nestedArr at idx currentIdx + 1


[} -

add to the sum the end rows (0, 7), element at idx midpoint of the row

add to the sumthe the end elements at the mid row (
  - the row at index midpoint, first element from elemen, last element

helper:(topHalf or bottomHalfRows, relevantCols) -
declare a sum
iterate over the given arr containing the rows from the matrix
  itertate over the topHalfROws, idx
    increment the sum by value from the nested arr at idx curentIDX  = relavantCols[idx + 1]
    increment the sum by the value from the nest arr at idx CurrentIDX + 1
return sum



each pair of consecutive integer represent sthe relevant
colNumbers

gridSize - 3 / 2 = the number rows - the number iterate over arr

declare a a sum initialize it to 0
max = 5 - 3 / 2 = 1

topHalf =
slice the matrix (1, 1 + max)
slice one row
[6, _, 8 _, 10]

max = 3
diamond(9)
topHalfRows = slice te matrix(1, 1 + max)
3 rows


*/
function makeMatrix(size) {
  let matrix = Array(size).fill(Array(size).fill(0)).map((row, idx) => {
    return row.map((num, idx2) => 1 + idx2 + idx * size);
  });

  return matrix
}

function diamond(gridSize) {
  if (gridSize === 1) return 1;
  let mid = Math.floor(gridSize / 2);
  let endPoints = [0, gridSize - 1];
  let matrix = makeMatrix(gridSize);

  let columns = columnIndexes(mid, endPoints);
  let top = matrix.slice(1, mid);
  let bottom = matrix.slice(mid + 1, endPoints[1]);

  let topSum = sumHalf(top, columns);
  let bottomSum = sumHalf(bottom, columns);
  let midSum = matrix[mid][endPoints[0]] + matrix[mid][endPoints[1]];
  let endSum = matrix.shift()[mid] + matrix.pop()[mid];
  console.log(topSum, bottomSum);
  return topSum + midSum + bottomSum + endSum;

}

function sumHalf(half, columns) {
  return half.reduce((sum, row, idx) => {
    if (idx !== 0) idx === 1 ? idx += 1 : idx += 2;
    return sum + row[columns[idx]] + row[columns[idx + 1]];
  }, 0);
}

function columnIndexes(midpoint, endpoints) {
  let colsIdxs = []
  let nextVals = [midpoint - 1, midpoint + 1]

  while (!samePoints(nextVals, endpoints) && colsIdxs.length < 10) {
    colsIdxs = colsIdxs.concat(nextVals);
    nextVals = [colsIdxs[colsIdxs.length - 2] - 1, colsIdxs[colsIdxs.length - 1] + 1]
  }

  return colsIdxs;
}

let samePoints = (points, other) => points.every((point, idx) => point === other[idx]);

// console.log(diamond(1))
// console.log(diamond(3))
// console.log(diamond(5))
// console.log(diamond(7))
console.log(diamond(11))
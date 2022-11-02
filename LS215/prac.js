/*
------------ **Explicit Requirements** -------------

Rules:

Inputs:

Output:
------------ **Implicit Requirements** -------------

------------- **Clarifying Questions** -------------

------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------

-------------------- Algorithm ---------------------


**** helper functions ****

---------------------- Notes -----------------------

*/
function diagonalize(gridSize, start) {
  let matrix = Array(gridSize).fill(Array(gridSize).fill(0))
  matrix = matrix.map((row, idx) => row.map((col, idx2) => idx2 + (idx)));

  switch (start) {
    case 'ul': return matrix;
    case 'ur': return matrix.map(row => row.reverse());
    case 'll': return matrix.reverse();
    case 'lr': return matrix.map(row => row.reverse()).reverse();
  }
}

console.log(diagonalize(3, "ul")) //➞ [
//   [0, 1, 2],
//   [1, 2, 3],
//   [2, 3, 4]
// ]

console.log(diagonalize(4, "ur")) //➞ [
//   [3, 2, 1, 0],
//   [4, 3, 2, 1],
//   [5, 4, 3, 2],
//   [6, 5, 4, 3]
// ]

console.log(diagonalize(3, "ll")) //➞ [
//   [2, 3, 4],
//   [1, 2, 3],
//   [0, 1, 2]
// ]

console.log(diagonalize(5, "lr")) //➞ [
//   [8, 7, 6, 5, 4],
//   [7, 6, 5, 4, 3],
//   [6, 5, 4, 3, 2],
//   [5, 4, 3, 2, 1],
//   [4, 3, 2, 1, 0]
// ]

/*
------------ **Explicit Requirements** -------------


Rules:
only entries with unique marks,
if there are multiple marks, take the eldest.


Inputs:
- takes an object,

Output:
- returns an object of all entries having unique marks


------------ **Implicit Requirements** -------------
- the objects are sorted by age when given.
- the objects are indexed

------------- **Clarifying Questions** -------------

------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------
objets, continue to work with objects, iterate over the objjcs
-------------------- Algorithm ---------------------
marke an empty arr containing all the marks

make a nested arr of entries
iterate over the arr,
filter the arr,
  - if the grade exists, return false (won't be selected
  - add each grade to the marks arr

transform the arr back to an object

**** helper functions ****

---------------------- Notes -----------------------

*/
function getObject(data) {
  let allMarks = []

  data = Object.entries(data).filter(([_, stats]) => {
    if (allMarks.includes(stats.marks)) return false;
    allMarks.push(stats.marks);
    return true;
  });

 data = data.map(([_,stats], id) => [id, stats]);
 return Object.fromEntries(data);
}

getObject({
  "0": { age: 18, name: "john", marks: "400" },
  "1": { age: 17, name: "julie", marks: "400" },
  "2": { age: 16, name: "Robin", marks: "200" },
  "3": { age: 16, name: "Bella", marks: "300" }
})

getObject({
  0: {age: 18, name: 'john', marks: '400'},
  1: {age: 17, name: 'julie', marks: '400'},
  2: {age: 16, name: 'Robin', marks: '200'},
  3: {age: 16, name: 'Bella', marks: '300'},
  4: {age: 16, name: 'john', marks: '250'},
  5: {age: 15, name: 'julie', marks: '250'}
})

/*
------------ **Explicit Requirements** -------------
takes an arr of strings of arbitrary dimensionality )
returns the sum of every separate number in each string in the arr.


Rules:

numbers can be negative, base 10 integers
hyphern character occurs in other numbers
arrays can be ragged or empty
negative numbers may directly follow another number

Inputs: array of strings which can be nested at no level (flat) or nested several levels deep


Output: integer: sum of every separate number in each string in the arrr, sum of each sequence of digits

------------ **Implicit Requirements** -------------
iterate x level deep while current evaluator is an arr
don't mutate the arr
------------- **Clarifying Questions** -------------

------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------
arr, continue working with arrs
-------------------- Algorithm ---------------------
reduce a shalllow copy of the arr
  - for each element, while any element of the arr is an array
    reassign the arr to a flattened arr

  let wordSum = 0
  -match any digits inthe arr using a regex, including - that prepend or are between numbers
  -iterate over the arr of digits,
    -if the digit contains a hypher,
      split the digits by hyphen as delimiter
        -add the first number in the arr to sum
        -subtract the last element in the arr from sum
    else
      increment wordSum after explicitly coercing the digit
  return sum + wordSum


**** helper functions ****

---------------------- Notes -----------------------

*/
function sum(arr) {
  function flatten(arr) {
    while (arr.some(element => Array.isArray(element))) {
      arr = arr.flat();
    }

    return arr
  }

  function sumDigits(word) {
    if (!word.match(/[-]*\d+/g)) return 0;
    return word.match(/[-]*\d+/g).reduce((sum, num) => sum + Number(num), 0);
  }

 return arr.slice().reduce((sum, ele) => {
   let flattened = Array.isArray(ele) ? flatten(ele) : ele
   let wordSum = 0

    if (Array.isArray(flattened)) {
      flattened.forEach((word) => wordSum += sumDigits(word));
   } else {
      wordSum += sumDigits(flattened);
   }

  return sum + wordSum
  }, 0);
}

console.log(sum(["1", "five", "2wenty", "thr33"]))
console.log(sum([["1X2", "t3n"],["1024", "5", "64"]]))
console.log(sum([[["1"], "10v3"], ["738h"], [["s0"], ["1mu4ch3"],"-1s0"]]))
console.log(sum([[["1"], "10v3"], ["7-138h"], [["s0"], ["1mu4ch3"],"-1s0"]]))
console.log(sum([[["1"], "10v-10"], [,,[,['dad50-2'],],], [["s01"], ["1mu4ch3"],"-1s0"]]))
console.log(undefined);

/*
------------ **Explicit Requirements** -------------

Rules:
the input arra will never be empty
the returned object should have each fruit in the same order

Inputs:
takes arr with nested objects:
  -each object can be a bunch of froots (quantity property over 1)
Output:
------------ **Implicit Requirements** -------------
looking ath the quantity property, replacing the current obj, since order must
be maintained
fruit bunche objects will have their qunatity replaced to 1, since 1

objects with 1 quantity are not replaced
------------- **Clarifying Questions** -------------


------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------
arr of entries
-------------------- Algorithm ---------------------
set fruits to an arr of nested arrs from the object
iterate over the fruits arr - transform
  call helper function that takes the quantity and an object


could also create a new arr, push the object at each time...

**** helper functions ****
repeatFruit - takes a quantity and object
returns the object repeated quantity times

---------------------- Notes -----------------------

*/

function splitBunches(obj) {
  function repeat(count, fruit) {
    let baseFruit = fruit
    baseFruit.quantity = 1;
    return Object(Array(count).fill(baseFruit));
  }

  let fruits = obj.map(fruit => repeat(fruit.quantity, fruit)).flat();
  return fruits;
}

splitBunches([
  { name: "grapes", quantity: 2 }
])

splitBunches([
  { name: "currants", quantity: 1 },
  { name: "grapes", quantity: 2 },
  { name: "bananas", quantity: 2 }
])

console.log(undefined);

/*
------------ **Explicit Requirements** -------------
given an arr of numbers
and a value for n,
split the numbers into n-sized groups

return the column number that has the greatest sum
if 2 columns have the same sum, return the one with the smallest colum num


Rules:
split the one dimensional arr to a matrix
take the sum of the columnss
return the col number of the col that has the greatest sum
If 2 cols have the same sum, return the one with the smallest col number
numbers will always into equal length groups

Inputs:

Output:
------------ **Implicit Requirements** -------------

------------- **Clarifying Questions** -------------
negative?
------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------
arrays
-------------------- Algorithm ---------------------
high-level
split the array into a matrix
reduce the matrix to their col sums

matrix to the maximum sum,
find the first index of the maximm sum

create an empty arr - matrix

split the array into a matrix
  iterate while idx <= length / colSize of the arr, increment idx
    iterate from 1 to colSize
      push the elements at idx of the inner iteration to the matrix

map the arr to their colSums

reduce the arr to a maxSum

look for the index of maxSum in the colSums arr


**** helper functions ****

---------------------- Notes -----------------------

*/
function maxSum(nums, n) {
  let matrix = []
  let row = []
  nums.forEach((ele, idx) => {
    row.push(ele);
    if (row.length === n) {
      matrix.push(row);
      row = []
    }
  });

  let colSums = matrix[0].map((_, colIdx) => matrix.reduce((sum, row) => sum + row[colIdx], 0));
  let maxSum = colSums.reduce((max, sum) => max > sum ? max : sum);

  return colSums.indexOf(maxSum) + 1;
}


let nums = [4, 14, 12, 7, 14, 16, 5, 13, 7, 16, 11, 19]
let n = 4
let nums2 = [4, 10, 12, 10, 4, 10, 12, 10] // 1
let nums3 = [4, 10, 12, -10, 4, 10, -12, 10] // 1


console.log(maxSum(nums, n))
console.log(maxSum(nums2, n))
console.log(maxSum(nums3, n)
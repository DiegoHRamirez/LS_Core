/*
------------ **Explicit Requirements** -------------
create a function that takes an array of numbers or strings
and returns an array with the items from the og array stored
in sub arrays

items of the same value should be in the same array
Rules:
-items of the same value should be in the same array
- the subarrays should be returned in the orrder
  of each elements first appearance,
-can always expect numbers ot string

Inputs:
- an array of nums or strings

Output:
an array with the original items stored in subarrays

------------ **Implicit Requirements** -------------
-iterate sequentially
- case sensitive, substrings are there own separate subarray

------------- **Clarifying Questions** -------------
should it be case insensitive?
partial matches? substring?

------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------
array

-------------------- Algorithm ---------------------
want an array of the unique elements, transform those elements
to a subarray,

create an arary of the nonunique elements,
create an object, elementCounts
iterate over nonunique elements,
  if element exist in object, increment count by 1
  else set to 1;

iterate over the unique elements, - transform
  if the element exist in the elementCounts
   retrieve its value,
   call helper funciton repeat(element, value in obj) - a new arr
   return the new arra
  else
    return the subarray as it is

return the new mapped array


**** helper functions ****
repeat(element, count)
  Array(count), fill it with the element(2)

---------------------- Notes -----------------------

*/
let repeat = (element, count) => Array(count).fill(element).flat();
let unique = array => array.filter((ele, idx) => array.indexOf(ele) === idx)

function arrSort(array) {
  let uniqueElements = unique(array)
  uniqueElements = uniqueElements.map(el => [el]);

  let counts = {}
  let nonUnique = array.filter((ele, idx) => array.lastIndexOf(ele) != idx);

  nonUnique.forEach(ele => counts[ele] ? counts[ele] += 1 : counts[ele] = 2);
  return uniqueElements.map(ele => counts[ele] ? repeat(ele, counts[ele]) : ele);
}

console.log(arrSort([1, 2, 3, 3, 4])); // [[1], [2], [3, 3], [4]]
console.log(arrSort([1, 2, 3, 4, 5]));// [ 5 elements]
console.log(arrSort(['s','s','b','d'])); // [['s', 's'], ['b'], ['d']]
console.log(arrSort(['s','s', 's','b','d'])); // [['s', 's'], ['b'], ['d']]
console.log(arrSort(['s','s','b', 'b','d'])); // [['s', 's'], ['b', 'b'], ['d']]
console.log(arrSort(['sss', 's', 'S', 'S!']));



/*
------------ **Explicit Requirements** -------------
Taking each 4 digit number of an array in turn,
return the number that you are on when all of the digits
0 - 9 have been discovered
If not all can be found, return

Rules:
if not all digits found, return a msg 'missing digits'

Inputs: an array of 4 digits numbers

Output: return the current number - iteration sequential
when all digits have been found (0 - 9)


------------ **Implicit Requirements** -------------

------------- **Clarifying Questions** -------------
- empty arr ?
- arr with other elements


------------ Examples/Test Cases/Edge's ------------
findAllDigits([5175, 4538, 2926, 5057, 6401, 4376, 2280, 6137, 8798, 9083]) ➞ 5057

------------------ Data Structure ------------------
array
-------------------- Algorithm ---------------------
create an arr of digits = []

iterate from idx 0 to ar length - 1, incremenet the idx
  access the digits at 'idx' from arr,
  turn the digits to a string, split it into an arr of digits.
  iterate over the arr of digits,
    -if the digit does not exists in digits,
      add it to the arr

  if digitsArr.length === 10, return the digits

return "Missing digits!"

**** helper functions ****

---------------------- Notes -----------------------

*/


function findAllDigits(digits) {
 let allDigits = [];

 for (let idx = 0; idx < digits.length; idx += 1) {
   let currentNum = digits[idx];
   String(currentNum).split('').forEach(digit => {
    if (!allDigits.includes(digit)) allDigits.push(digit);
  });

  if (allDigits.length === 10) return currentNum;
 }

  return 'Missing digits!';
}

findAllDigits([5175, 4538, 2926, 5057, 6401, 4376, 2280, 6137, 8798, 9083]) //➞ 5057
// digits found:  517-  4-38  29-6  -0

findAllDigits([5719, 7218, 3989, 8161, 2676, 3847, 6896, 3370, 2363, 1381]) //➞ 3370
// digits found:  5719  -2-8  3---  --6-  ----  --4-  ----  ---0

findAllDigits([4883, 3876, 7769, 9846, 9546, 9634, 9696, 2832, 6822, 6868]) //➞ "Missing digits!"
// digits found:  48-3  --76  ---9  ----  -5--  ----  ----  2---
// 0 and 1 are missing
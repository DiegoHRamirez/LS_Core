/*
------------ **Explicit Requirements** -------------


Rules:



Input:
takes an array

Output:

returns the most frequently occuring element
------------ **Implicit Requirements** -------------

------------- **Clarifying Questions** -------------
what all elements occur the same number of times
what if 2 elements that are the most freq occuring have the same `count` ??

return the most frequently occuring elements, 2, return an arr of the 2 elements
return the same arr if the coutns are all equal

condition, return a msg 'no elements'
------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------
create an empty obj, wordCoutns

iterate over the arr, passing each val to callback
  check to see if the word exists in wordCounts[currentWord]
    if it exists, increment count by 1
    else add a new property to the obj, wordCounts[currentWord] = 1;

maxCount
find the max value in wordCounts
  iterating over an array of subarrays(each subarray is a property in the object)
    reduce the arr to the largest value (the element at index [1] of each subarrays

mostFrequenct = []
iterate over the wordCounts, add to the mostFrequent arr
  any property name whose value is equal to the maxCount

if the arr.length === 1, return the element in arr
if its greater than 1, return the arr
if the length is 0, return a msg

-------------------- Algorithm ---------------------


**** helper functions ****

---------------------- Notes -----------------------
*/
function findFrequent(arr) {
  let elementCounts = arr.reduce((counts, element) => {
    counts[element] ? counts[element] += 1 : counts[element] = 1;
    return counts;
  }, {});

  let maxCount = Object.entries(elementCounts).reduce((max, [_,count]) => {
    return max > count ? max : count;
  }, 0);

  let mostFrequent = []
  for (let element in elementCounts) {
    if (maxCount === elementCounts[element]) mostFrequent.push(element);
  }

  logStats(mostFrequent, arr);
}

function logStats(mostFrequent, arr) {
  let copyArr = arr.map(el => String(el));

  if (mostFrequent.length === 1) {
    console.log(arr[copyArr.indexOf(mostFrequent.pop())]);
  } else if (mostFrequent.length > 1) {
    console.log(mostFrequent.map(element => arr[copyArr.indexOf(element)]))
  } else {
    console.log('There are no elements in this array');
  }
}


findFrequent([]);
findFrequent([undefined, undefined, 4]);
findFrequent([3, 7, 3]) //➞ 3
findFrequent([null, "hello", true, null]) //➞ null
findFrequent([false, "up", "down", "left", "right", true, false]) //➞ false
findFrequent([5, 2, 1])
findFrequent([5, 5, 2, 2, 1])
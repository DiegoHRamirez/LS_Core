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


/*
------------ **Explicit Requirements** -------------
returns which chapter is the nearest to the page currently on.
If two chapters are equidistant, return the chapter with the
higher page number.

Rules:
if 2 chapters are equidistant, return the chap with higher page #

Inputs:
2 arguments,
  - object: contains chapter data, where the chapter begins
  - currentpage number.
can expect all page numbers to be valid integers

Output:
the nearest chapter,
------------ **Implicit Requirements** -------------
the chapter whose page number is closest to the page
the names of the properities in the object can anything, returning the name of the property
the difference between the chapter page num and current page
absolute difference,

------------- **Clarifying Questions** -------------

------------ Examples/Test Cases/Edge's ------------

------------------ Data Structure ------------------
object, select an object off a certain
arr.
-------------------- Algorithm ---------------------
create an arr, NearestChapter

currentNearest; - keep track of the nearest (the smallest absVal)
map an arr of values from the chapters to the abs dif (page - chapter[prop])
compute the min
get an arr of the entries in the object,


see if there is more than one occurence of min, if there is, transform the arr to the
keys at idx[idx]


**** helper functions ****

---------------------- Notes -----------------------

*/
function nearestChapter(chapters, currentPage) {
  let nearest = Object.values(chapters).map(page => Math.abs(currentPage - page));
  let min = nearest.sort((p1, p2) => p1 - p2).shift();
  let chaps = Object.entries(chapters);
  chaps = chaps.filter(([chap, chapPage]) => Math.abs(chapPage - currentPage) === min);
  let maxChapter = chaps.reduce((max, chapter) => chapter[1] > max[1] ? chapter : max);
  return maxChapter.shift();
}

nearestChapter({
  "Chapter 1" : 1,
  "Chapter 2" : 15,
  "Chapter 3" : 37
}, 10) //➞ "Chapter 2"


nearestChapter({
  "New Beginnings" : 1,
  "Strange Developments" : 62,
  "The End?" : 194,
  "The True Ending" : 460
}, 200) //➞ "The End?"


nearestChapter({
  "Chapter 1a" : 1,
  "Chapter 1b" : 5
}, 3) //➞ "Chapter 1b"
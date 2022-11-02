/*
function converts the DOM, starting from `body` to nested arrays

each element in the DOM is represented as
[ `parent_tag_name", [children]]

when an element has no children, children is represented by an empty arrw
 starts fro the body

 starting from the body: easy recursive


start from the body element,
ex: [tagName [children]]

for each body element, iterate inwards until children.length === 0 ,empty
transform the arr, for each element call nodesTOarr,

if arr length === 0 , return an arr with tagname and empty arr
*/
//


  <body>
    <header id="1"></header>
    <main id="2">
      <div></div>
      <div></div>
    </main>
    <footer id="3"></footer>
  </body>

function nodesToArr(currentGen = document.body) {
  return  [currentGen.tagName, [...currentGen.children].map(nodesToArr)];
}
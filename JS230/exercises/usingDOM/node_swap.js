/*
function takes two node ids as arguments
 -swaps the positions of the nodes represented by the ids

 the function returns `true` for valid swaps and undefined for invalid
  - undefined when one of the id attributes doesnt exits



essentially,
find one node by id
find other nodes next sibling

find other node by id
insert node using el.parentNod.replace(el2, el1)

insert el1 before el2s next sibling

parent.insertBefore(node, target)


*/

function nodeSwap(id1, id2) {
  let [node1, node2] = [document.getElementById(id1), document.getElementById(id2)]
  if (!(node1 && node2) || node2.parentNode !== node1.parentNode) return;
  let parent = node1.parentNode;
  let placeHolderNode = node1.cloneNode(false);

  parent.replaceChild(placeHolderNode, node1);
  parent.replaceChild(node1, node2);
  parent.replaceChild(node2, placeHolderNode);
  return true;
}

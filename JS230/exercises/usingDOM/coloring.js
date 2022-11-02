/*
function colors a specific generation of the DOM tree

starting from the top level node:,
given an integer argument:

color the dom nodes x levels deep

starting from the the body,
- loop until the generation equals the numbers given,
- then get all the children of the parent node,
  - iterate over each adn add the generation color class to each


you set the currentGen default to the an arr ok.
but then how will you get all the

generation will equal 0, but currentGen will just be an array of the children of the immediate.. ohh

so you want to iterate over each of the children? and then convert each node to its children counterPart?

*/
// 2
let addColor = (element) => element.classList.add('generation-color');

function colorGeneration(generation, currentGen = [document.body.children]) {
  if (generation <= 0) return;
  if (generation === 1) currentGen.forEach(gen => [...gen].forEach(addColor));

  let nextGen = currentGen.map(gen => [...gen].map(node => node.children))
  colorGeneration(generation - 1, nextGen.flat()); // 0
}

function coloring(gen, parent = document.body, indent = 0) {
  if (indent === gen && parent.id) parent.classList.toggle('generation-color');
  [...parent].forEach(child => coloring(gen, child, indent + 1));
}
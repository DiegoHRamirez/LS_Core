/*
write JS code that updates the options on one dropdown when the selection in
the other dropdown changes

add an event listener to the selector,
if the

make a helper that determines the selected option

swap selected helper sets the current selecte property to false,
and the new selected option `selected` property to true

when either selector is clicked, you show the options for each,
the options are all enclosed within a box of content the same width as the selector
when the user hovers over an option, it gets highlighted, background is set to blue

when the user clicks an option, it gets set as the selected
then call swap selected
return

depending on what selector is chose, you should change the other potential selectors
when a classification is selected, use a dispatch table to retrieve the relevant
corresponing animal or type selector values

object: classifications
animal: all animals
vertebrate: bear, turtle, whale, salmon, ostrich
warm-blooded: bear, tutle, whale, ostrich
cold-blooded: salmon
mammal: bear, whale, ostrich
bird:

use helper method getTypes(type)


helper getAnimalsForType
*/

document.addEventListener('DOMContentLoaded', () => {
  const classifications = {
    'Classifications': ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
    'Vertebrate': ['Bear', 'Turtle', 'Whale', 'Ostrich', 'Salmon'],
    'Warm-Blooded': ['Bear', 'Turtle', 'Whale', 'Ostrich'],
    'Cold-Blooded': ['Salmon'],
    'Mammals': ['Bear', 'Whale', 'Ostrich'],
  }

  let typeSelector = document.querySelector('#animal-classifications');
  let animalSelector = document.querySelector('#animals');

  function getAnimalsFor(type) {
    let animals = classifications[type];

    [...animalSelector.children].forEach(option => {
      let name = option.value;
      option.style.display = animals.includes(name) ? 'visible' : 'hidden';
    })
  }

  function getTypes(animal) {
    [...typeSelector.children].forEach(option => {
      let typeName = option.value;

      if (classifications[typeName].includes(animal)) {
        option.style.display = 'visible';
      } else {
        option.style.display = 'none';
      }
    });
  }

  function swapSelection(current, newSelection) {
    current.selected = false;
    newSelection.selected = true;
  }

  function findSelected(selector) {
    return selector.querySelector('option[selector]');
  }


  typeSelector.addEventListner('click', function(event) {
    if (event.target.parentNode === this) {
      let newType = event.target
      getAnimalsFor(newType.value);
      swapSelection(findSelected(this), newType);
    }
  });

  animalSelector.addEventListener('click', function(event) {
    if (event.target.parentNode === this) {
     let newAnimal = event.target;
     getTypes(newAnimal);
     swapSelection(findSelected(this), newAnimal);
    }
  });
})
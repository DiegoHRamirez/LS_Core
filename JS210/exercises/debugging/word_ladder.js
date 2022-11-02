/*
generating word ladders:
- transforming one word into another word one character at a time
- the smallest of her tasks is to print the resulting ladder to the screen


*/

let ladder = '';

['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(word => {
  if (ladder !== '') {
    ladder += '-'
  }

  ladder += word
})

console.log(ladder)  // expect: head-heal-teal-tell-tall-tail
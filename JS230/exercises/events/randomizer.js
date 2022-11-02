/*
function accepts n callbacks

calls each callback at some random point in time between now an 2 * n seconds from now

e.g caller provides 5 callbacks, the functions should run them all sometime within 10 seconds''
e.g time to ru
perfect example for promise chain, essentially,

steps:
- capture the functions as an arr
- iteraate over the arr,

execute this asynchronous code sequentially
- at each iteration
  - call one of the callback, then proceed to the next


how would you code this?
- with async or await
- loop over each, await
*/

function randomizer(...callbacks) {
  let max = 2000 * callbacks.length
  let randomTime = () => Math.floor(Math.random() * max);

  callbacks.forEach(func => setTimeout(() => func(), randomTime()));
}

function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

randomizer(callback1, callback2, callback3);
setTimeout(() => console.log('times up'), 2000 * 3);
// function logger(object) {
//   console.log(object);
// }

// let numbers = [1, 20, 50];

// numbers.forEach(logger);
// console.log(numbers.length);


// setTimeout(() => {
//   console.log('!');
// }, 3000);

// setTimeout(() => {
//   console.log('World');
// }, 1000);

// console.log('Hello');


//p1

// function delayLog() {
//   let range = Array(10).fill(0).map((_,idx) => idx + 1);
//   range.forEach(num => {
//     //setTimeout(() => console.log(num), 1000 * num);
//   });
// }

// delayLog();

// p2 order of execution

// setTimeout(() => { // 1
//   console.log('Once'); // 5
// }, 1000);

// setTimeout(() => { // 2
//   console.log('upon'); // 7
// }, 3000);

// setTimeout(() => { // 3
//   console.log('a'); // 6
// }, 2000);

// setTimeout(() => { // 4
//   console.log('time'); // 8
// }, 4000);

//p3 order of exec

// setTimeout(() => {
//   setTimeout(() => {
//     q();
//   }, 15); // 6

//   d(); // 1

//   setTimeout(() => {
//     n();
//   }, 5); // 4

//   z(); // 5
// }, 10);

// setTimeout(() => {
//   s();
// }, 20); // 7

// setTimeout(() => {
//   f(); // 2
// });

// g(); // 3

// d > f > g > n > z > q > s

function afterNSeconds(func, seconds)  {
  setTimeout(func, seconds * 1000);
}
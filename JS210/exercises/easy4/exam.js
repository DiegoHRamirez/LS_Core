// console.log(typeof speak);

// var speak = function() {
//   console.log('Howdy!');
// }


// "use strict";


// let speak = function() {
//   console.log('Howdy!');
// }


// console.log(typeof speak);

// function fun1() {
//   if (true) {
//     var number = 42;
//   }

//   console.log(number);
// }

// fun1();

// function concatenate(string1, string2) {
//   if (string2) {
//     return string1 + string2;
//   } else {
//     return function fooCat(string) {
//       return string1 + string;
//     };
//   }
// }

// console.log(concatenate('ab', 'cd') === 'abcd');            // true
// console.log(concatenate('cba', 'xyz') === 'cbaxyz');        // true

// const fooCat = concatenate('foo');
// console.log(fooCat('bar') === 'foobar');                    // true
// console.log(fooCat('xyzzy') === 'fooxyzzy');                // true

// let greeting = 'Hi';

// function greet(name) {
//   return `${greeting}, ${name}.`;
// }

// greeting = 'Hello';
// console.log(greet('Jackie'));

// var a = a + 1;
// console.log(a);

//let counter = 0;

// function incrementCounter() {
//   counter = counter + 1;
// }

// incrementCounter();
// console.log(counter);

// let counter = 0;

// function incrementCounter() {
//   var counter = counter + 1;
//   return counter;
// }

// console.log(incrementCounter());
// console.log(counter);

// let counter = 0;

// function incrementCounter(counter) {
//   counter = counter + 1;
// }

// incrementCounter(counter);
// console.log(counter

// function run() {
//   go();
//   return function go() { console.log('Go was called'); };
// }

// let omg = run();

// run();
// function swapEnds(arr) {
//   arr = [...arr];
//   let first = arr[0];
//   let last = arr[arr.length - 1];

//   arr[0] = last;
//   arr[arr.length - 1] = first;
//   return arr;
// }

// let numbers = [1, 2, 3, 4];
// swapEnds(numbers);
// console.log(numbers);

// let student = {
//   firstName: 'Diego',
//   lastName: 'Hernandez Ramirez',
//   semester: 'Fall',
//   dateOfBirth: new Date(2001, 3, 21),
//   grades: { math: 'A', Physics: 'A', English: 'B' },
// }

// console.log(student);
// console.log(student.grades.math);


// function isEmpty(value) {
//   let type = typeof value;
//   if (type === 'string') {
//     return value.length === 0;
//   } else if (Array.isArray(value)) { //added else if condition
//     return value.length === 0 || !value.some(a => a);
//   } else if (type === 'object') {
//     return Object.keys(value).length === 0;
//   }
// }

// // current test cases
// console.log(isEmpty({}));                  // true
// console.log(isEmpty({ name: 'Janice' }));  // false

// console.log(isEmpty(''));                  // true
// console.log(isEmpty('Janice'));            // false

// console.log(isEmpty(['Janice']));          // false
// // test case
// let array = []
// array[-4] = 'not an index';                             // subtle bug

// console.log(isEmpty(array));               // true

// //added an additional condition in case that the array contained only empty items
// array.length = 5;
// console.log(isEmpty(array));               // true

// var okOK = 'okok';

// delete okOK;

// console.log(okOK);

function concatenate(...strings) {
  if (strings.length === 2) {
    return strings[0] + strings[1];
  } else {
    return function fooCat(string) {
      return strings[0] + string;
    };
  }
}

console.log(concatenate('ab', 'cd') === 'abcd');            // true
console.log(concatenate('cba', 'xyz') === 'cbaxyz');        // true
console.log(concatenate('hi', '') === 'hi');

const fooCat = concatenate('foo');
console.log(fooCat('bar') === 'foobar');                    // true
console.log(fooCat('xyzzy') === 'fooxyzzy');                // true

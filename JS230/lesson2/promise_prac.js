// function promiseExample() {
//   return new Promise((resolve, reject) => {
//     return setTimeout(() => reject('not launch schoool'), 2000);
//   });
// }


// promiseExample().then(result => {
//   console.log(result);
// }).catch(err => {
//   console.log(err);
// })

// // const promise = new Promise(function(resolve, reject) {
// //   setTimeout(() => resolve('Launch School'), 2000);
// // });

// // promise.then(function(val) {
// //   console.log(val);
// // });



// /* execution flow example */
// const promise1 = new Promise((resolve, reject) => {
//   console.log("foo");
//   resolve();
//   console.log("bar");
// });

// promise1.then(() => {
//   console.log("baz");
// });

// console.log("qux");
// /*
// 1st the callback to Promise runs whent the new `Prommise` object is constructod,
// so `foo` is the first line of output.
// The `resolve()` invocation marks the promise as resolsved but doesn't do anything else since
// `then` has yet to yet to be called (execution is at line 27).
// Then line 28 executes, outputting `bar` to the console.

// Next you invoked `promise1.then`. Since the `then`'s callback runs asynchronously, it awaits
// in the microtask queue until the stack is empty, and it gets pushed onto the stack by the event loop.

// Line 11 executes, outputing `qux`.

// Finally, the asynchronous callback for `then` runs, printing `baz` last.

// */


// /* execution flow with asynchronous code example 2 */

// /*
// foo
// bar
// abc
// qux
// */
// const promise11 = new Promise((resolve, reject) => {
//   console.log("foo");
//   reject();
//   console.log("bar");
// });

// promise
//   .then(() => {
//     console.log("baz");
//   })
//   .catch(() => {
//     console.log("qux");
//   });

// console.log("abc");


// /* execution flow with promises example 3 */

// /*
// 1
// 3
// 6
// undefined

// */
// const promise = new Promise(res => res(1));
// promise
//   .then((num) => {
//     console.log(num);
//     return num + 2;
//   })
//   .then((num) => {
//     console.log(num);
//     return num + 3;
//   })
//   .then((num) => {
//     console.log(num);
//     return num + 4;
//   })
//   .finally((num) => {
//     console.log(num);
//     return num + 5;
//   });


// // execution flow promises ex 4

// /*
// again
// oops


// */

// const promise4 = new Promise((resolve, reject) => {
//   resolve("Got it!");
//   reject("Oops.");
//   resolve("Again!");
// });

// promise4
//   .then((res) => {
//     console.log(res);
//   })
//   .catch((err) => {
//     console.log(err);
//   });

// console.log(undefined);

function after1s(x) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(x);
    }, 1000);
  });
}

async function test(input) {
  const a = await after1s(2);
  const b = await after1s(3);
  return input * a * b;
}

test(3).then((value) => console.log(value));
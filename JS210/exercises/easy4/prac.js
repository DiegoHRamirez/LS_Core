// function add(first, second) {
//   return first + second
// }

// function makeAdder(firstNumber) {
//   return function(secondNumber) {
//     return add(firstNumber, secondNumber);
//   };
// }


// let addFive = makeAdder(5);

// let addTen = makeAdder(10);


// console.log(addTen(50));

// let object = {
//   a: 1,                           // a is a string with quotes omitted
//   'foo': 2 + 1,                   // property name with quotes
//   'two words': 'this works too',  // a two word string
//   true: true,                     // property name is implicitly converted to string "true"
//   b: {                            // object as property value
//     name: 'Jane',
//     gender: 'female',
//   },
//   c: function () {                // function expression as property value
//     return 2;
//   },
//   d() {                           // compact method syntax
//     return 4;
//   }
// };

// for (let prop in object) {
//   console.log(prop);
//   console.log(object[prop]);
// }

// console.log(Object.keys(object));



/*
On line 1, the `function` keyword declares a global function with the name `placeABet` with
one parameter `guess` and a function body from lines 1 - 17.

On line 19, the `userGuess` global variable is declared with the `const` keyword and
initialized to the return value of calling the parseInt function and passing
`prompt('Input a guess between 1-25')` and the integer 10 that represents the radix as an argument.
`prompt('Input a guess between 1-25')` ouputs the `Input a guess between 1-25` to the console, and
returns the user input as a string primitive type.
parseInt converts the string to an integer and that value is the value that `userGuess` gets
initialized to.

On line 10, the function `alert` is invoked and the integer value of the `userGuess` is passed
as an argument.
Within the function body, on line 2 the parenthesis marks the beginning of a named function
expression.
Being a function expression, the name can only be used within the scope of the function, so
when the function is invoked on line 6, JS raises a syntax error, as there is no
function with the name generateRandomInt avaialble in the local scope.

*/

function placeABet(guess) {
  (function generateRandomInt() {
    return Math.floor(Math.random() * 25) + 1;
  });

  const winningNumber = generateRandomInt();

  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}

const userGuess = 10;
console.log(placeABet(userGuess));
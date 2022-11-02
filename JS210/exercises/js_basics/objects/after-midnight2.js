const MILLISECONDS_IN_MINUTE = 60000

function afterMidnight(timeStr) {
  let today = new Date
  today.setHours(0)
  today.setMinutes(0)

  let [hour, minute] = timeStr.split(':');
  let date = new Date();

  date.setHours(hour);
  date.setMinutes(minute);

  let milliseoonds = Math.floor(today.getTime() - date.getTime());
  return (Math.abs(milliseoonds) / MILLISECONDS_IN_MINUTE);
}

// returns the number of minutes,

// use a date object instead of...
function beforeMidnight(timeStr) {
  let totalMinutes = 24 * 60;
  let minutes = afterMidnight(timeStr) || totalMinutes;

  console.log(Math.floor(totalMinutes - minutes));
}

afterMidnight('00:00');       // 0
beforeMidnight('00:00');      // 0
afterMidnight('12:34');       // 754
beforeMidnight('12:34');      // 686


/*
false
undefined
undefined
false
false
undefined
'a'
'a'
undefined
undefined
*/

// infinite loop, outputting 0....
// because it starts at 0!!!

//multiplication table,
// the outer loop stop iterating before it reaches 10.


// what is the hoisting order?
// outputs 15, the variable 'counter' whose value was the function is reassigned on line 1.

// return value of invoking the funciton `counter` * undefined
// NaN

// return value of invoking the function 15 * 3

// 4
// error message, won't let you declare a variable that's already been `declared

// var counter = 5;
// var rate = 3;

// // remember
// function counter(count) {
//   return 20
// }

// console.log('The total value is ' + String(counter * rate));
let counter = 5;
let rate = 3;


console.log('The total value is ' + String(counter * rate));

// logger
// the private function logger's closure has a refernce to the status variable.
// when the funciton `debugIt()` is called on line 10, the last line of the function body
// invokes the logger function which outputs the `debugging`

function invoiceTotal(...amounts) {
  return amounts.reduce((sum, amount) => sum + amount);
}

invoiceTotal(20, 30, 40, 50);          // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?
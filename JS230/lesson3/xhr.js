
// JS code that makes a GET request to this URL: https://api.github.com/repos/rails/rails.

// let request = new XMLHttpRequest();
// request.open('GET', 'https://api.github.com/repos/rails/rails');
// request.send();

// //contains raw response
// //request.responseText

// // to run some code when an event occurs on an XHR object
// request.addEventListener('load', event => {
//   let xhr = event.target // the request is available as event.target if you can't access it from an outer scope

// })



// let request2 = new XMLHttpRequest();
// request2.open('get', 'https://api.github.com/repos/rails/rails');
// request.responseType = 'json';

// request2.addEventListener('load', event => {
//   let data = JSON.parse(request.response);
//   console.log(request.status);
//   console.log(data.open_issues);
// });

// request.send();

let request = new XMLHttpRequest();
request.open('GET', 'https://api.github.com/repos/rails/rails');

request.addEventListener('load', event => {
  let data = JSON.parse(request.response);
  console.log(request.status);
  console.log(data.open_issues);
});

request.addEventListener('error', () => console.log('request could not be completed'));

request.send();



/*
sending a basic POST request from JavaScript
*/
let request2 = new XMLHttpRequest();
request.open('POST', 'URL');
let data = 'encoded query string';

request2.send(data);

/* to send in JSON format, update the code to create a valid JSON string*/

let request3 = new XMLHttpRequest();
request3.open('POST', 'url');

let data2 = { title: 'Eloquent JS', author: 'marijn Haverbeke'}
let json = JSON.stringify(data2);
request.send(json);

/* must set the Content-Type request header to applicaiton/json: charset=utf-8 
  tells the server to expect JSON data. It's a good habit to always set the value explicitly
*/


/*
POST /books HTTP/1.1
Host: ls-230-bookcatalog.herokuapp.com
{"title": "Eloquent JavaScript", "author": "Marijn Haverbeke"}
Accept: 

{"title": "Eloquent JavaScript", "author": "Marijn Haverbeke"}


*/
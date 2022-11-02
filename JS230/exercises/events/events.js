/*
implement a function that tracks events on a web page by wrapping a callback function
in a function that adds ech event to a `tracker` object before invoking the callback

takes a callback function as an argument, returns a new function that
records the event, if the event has not been recorded before
executes the original callback

scenario:
assume that user clicks the elements in the following order: div#blue, red, orange, gren
divs order clicked : blue > red > orange > green

use click event listeners for the four elements

the tracker object has these properties:
- list() function returns a copy of l=all the event objects
- elements() function returns a copy of all the elements that the event was executed on
- clear()

takes the
*/

class Tracker {
  #events;

  constructor() {
    this.#events = [];
  }

  list() {
    return this.#events.slice();
  }

  elements() {
    return this.list().map(({target}) => target);
  }

  clear() {
    this.#events.length = 0;
    return this.#events.length
  }

  update(e) {
    if (this.#events.includes(e)) return;
    this.#events.push(e);
  }
}

let tracker = new Tracker;

function track(callback) {
  return function(event) {
    tracker.update(event);
    callback(event);
  }
}

document.addEventListener('DOMContentLoaded', function() {
  let divRed = document.querySelector('div#red');
  let divBlue = document.querySelector('div#blue');
  let divOrange = document.querySelector('div#orange');
  let divGreen = document.querySelector('div#green');

  divRed.addEventListener('click', track(event => {
    document.body.style.background = 'red';
  }));

  divBlue.addEventListener('click', track(event => {
    event.stopPropagation();
    document.body.style.background = 'blue';
  }));

  divOrange.addEventListener('click', track(event => {
    document.body.style.background = 'orange';
  }));

  divGreen.addEventListener('click', track(event => {
    document.body.style.background = 'green';
  }));
})

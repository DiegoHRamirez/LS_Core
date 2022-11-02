/*
makes the element bold
allows the user to do something else



*/

function makeBold(element, callback) {
  element.style.fontWeight = 'bold';
  return typeof callback !== 'function' || callback(element);
}

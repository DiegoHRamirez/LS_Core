function subElements(object) {
  return object.flatMap((element, idx) => {
    return object.slice(idx).map((_, idx2, obj2) => {
      return obj2.slice(0, idx2 + 1);
    })
  });
}

function subString(string) {
  let substrings = []

  for (let index = 0; index < string.length; index += 1) {
    for (let idx2 = index; idx2 < string.length; idx2 += 1) {
      substrings.push(string.slice(index).slice(0, idx2 + 1));
    }
  }

  return substrings;
}

let string = 'string';
// two ways to retrieve a substring, can use a the same subelements, or....
subString(string) === subElements([...string]).map(str => str.join(''));

console.log(subElements([1, 2, 3, 4, 5]));

[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [2, 1]
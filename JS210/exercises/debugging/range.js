function makeRange(start, end) {
  const range = [];

  for (let element = start; element <= end; element++) {
    range.push(element);
  }

  return range;
}

function range(start, end) {
  return end ? makeRange(start, end) : makeRange(0, start);
}

// Examples

function rangeEx(...args) {
  let [start, end] = args.length > 1 ? [args[0], args[1]] : [0, args[0]];
  return [...Array(end - start + 1)].map((_, idx) => idx + start);
}

let rangeEx2 = (...args) => [...Array(args[1] - args[0] + 1)].map((_, idx) => idx + args[0]);


console.log(range(10, 20));
console.log(range(5));
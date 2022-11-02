document.addEventListener('DOMContentLoaded', event => {
  let form = document.querySelector('form');
  let input = document.querySelector('#guess');
  let paragraph = document.querySelector('p');
  let newGame = document.querySelector('a')

  let guesses;
  let random;

  function resetGame() {
    guesses = 0;
    random = Math.floor(Math.random() * (100 - 1) + 1);
    paragraph.textContent = 'Guess a number between 1 and 100';
    input.value = '';
  }

  function accuracy(guess) {
    return guess > random ? 'lower' : 'higher'
  }

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    guesses += 1;
    let guess = parseInt(input.value, 10);

    if (random === guess) {
      paragraph.textContent = `You guessed it! Took you ${guesses} tries`
    } else {
      let text = `My number is ${accuracy(guess)} than ${guess}`
      paragraph.textContent = text;
    }
  })

  newGame.addEventListener('click', event => {
    event.preventDefault();
    resetGame();
  })

  resetGame();
})

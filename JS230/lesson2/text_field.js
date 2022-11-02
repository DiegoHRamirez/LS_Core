let textField = document.querySelector('.text-field');
let id;

document.addEventListener('DOMContentLoaded', event => {
  textField.addEventListener('click', event => {
    event.stopPropagation();
    textField.classList.add('focused');
    if (!id) id = setInterval(() => textField.classList.toggle('cursor'), 500);
  })
})

document.addEventListener('keydown', event => {
  if (!textField.classList[0]) return;
  let content = document.querySelector('.content');
  let text = content.textContent || ''

  if (event.key === 'Backspace') {
    content.textContent = text.slice(0, text.length - 1);
  } else {
    content.textContent = text += event.key;
  }
})

document.addEventListener('click', () => {
  clearInterval(id);

  textField.classList.remove('focused');
  textField.classList.remove('cursor')
})

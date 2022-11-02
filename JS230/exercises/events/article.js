/*
given HTML and CSS from codepen

implement JS code to:


*/

document.addEventListener('DOMContentLoaded', function(event) {
  let main = document.querySelector('main');
  let linkList = document.querySelector('ul');

  function swapHighlight(newHighlight) {
    let current = document.querySelector('.highlight')
    !current || current.classList.remove('highlight');
    newHighlight.classList.add('highlight');
  }

  function findParentArticle(element) {
    if (element.id && element.id.includes('article')) return element;
    return findParentArticle(element.parentNode)
  }

  document.body.addEventListener('click', function(event) {
    event.stopPropagation();
    let target = main.contains(event.target) ? event.target : main;

    if (target === main || target.tagName === 'H1') {
      swapHighlight(main);
    } else {
      swapHighlight(findParentArticle(target));
    }
  });

  linkList.addEventListener('click', function(event) {
    if (event.target instanceof HTMLAnchorElement) {
      event.stopPropagation();

      let articleId = event.target.getAttribute('href').slice(1);
      let article = document.querySelector(`#${articleId}`);
      swapHighlight(article);
    }
  } )
});


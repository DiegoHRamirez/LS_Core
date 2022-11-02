let id;

function startCounting(num = 1) {
  id = setInterval(() => {
    console.log(num);
    num += 1;
    }, 1000);
}

function stopCounting() {
  setTimeout(() => clearInterval(id), 4 * 1000);
}

startCounting();
stopCounting();



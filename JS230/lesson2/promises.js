function makeRequest(location) {
  return new Promise((resolve, reject) => {
    console.log(`making request to ${location}`);
    if (location === 'Google') {
      resolve('Google Says Hi');
    } else {
      reject('we can only talk to Google');
    }
  })
}

function processRequest(response) {
  return new Promise((resolve, reject) => {
    console.log('processing response');
    resolve(`Extra info + ${response}`);
  })
}



async function doWork() {
  try {
    const response = await makeRequest('FB');
    //await implies that code should wait until makeRequest is finished to return the next function
    // once JS hits the await statement, it will leave the function, do other work, and once the
    // makeRequest finishes executing it will come back and return the result to the response variable
    console.log('response received');
    const processedResponse = await processRequest(response);
    console.log(processedResponse);
  } catch (err) {
   console.log(err);
  }
}

doWork();
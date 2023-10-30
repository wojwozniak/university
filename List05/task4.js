const fs = require('fs').promises;
const path = 'List05/task4.txt';

fs.readFile(path, 'utf8')
  .then((content) => {
    console.log(content);
  })
  .catch((err) => {
    console.error('error:', err);
  });
const path = 'List05/task7.txt';

// 1) Klasyczny interfejs asynchroniczny z użyciem callback
const fs = require('fs');

function readFile(filename, callback) {
    fs.readFile(filename, 'utf8', (err, data) => {
        if (err) {
            callback(err, null);
        } else {
            callback(null, data);
        }
    });
}

readFile(path, (err, data) => {
    if (err) {
        console.error('Err:', err);
    } else {
        console.log('Content:', data);
    }
});



// a) Za pomocą "ręcznie" napisanej funkcji przyjmującej te same argumenty co fs::readFile, ale zwracającej Promise
const fs2 = require('fs').promises;

function readFilePromise(filename) {
    return fs2.readFile(filename, 'utf8');
}

readFilePromise(path)
    .then((data) => {
        console.log('Content:', data);
    })
    .catch((err) => {
        console.error('Err:', err);
    });



// b) Za pomocą util.promisify
const util = require('util');
const readFilePromiseUtil = util.promisify(fs.readFile);

readFilePromiseUtil(path, 'utf8')
    .then(data => {
        console.log('Content:', data);
    })
    .catch(err => {
        console.error('Err:', err);
    });



// c) Za pomocą fs.promises
const fs3 = require('fs').promises;

fs3.readFile(path, 'utf8')
    .then(data => {
        console.log('Content:', data);
    })
    .catch(err => {
        console.error('Err:', err);
    });



// Pierwszy rodzaj odczytu powyżej
// teraz async/await
async function readFileAsyncNew(filename) {
    try {
        const data = await readFilePromise(filename);
        console.log('Content:', data);
    } catch (err) {
        console.error('Err:', err);
    }
}
readFileAsyncNew(path);
const http = require('http');

function fetchPageContent(url) {
    return new Promise((resolve, reject) => {
        http.get(url, (response) => {
            let content = '';

            response.on('data', (data) => {
                content += data;
            });

            response.on('end', () => {
                resolve(content);
            });

            response.on('error', (error) => {
                reject(error);
            });
        });
    });
}

const url = 'http://example.com';
fetchPageContent(url)
    .then((content) => {
        console.log(content);
    })
    .catch((error) => {
        console.error('An error occurred while fetching the page content:', error);
    });
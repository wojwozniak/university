const https = require('https');
const fs = require('fs');

const options = {
    pfx: fs.readFileSync('name.csr'),
    passphrase: '123'
};

const server = https.createServer(options, (req, res) => {
    res.setHeader('Content-type', 'text/html; charset=utf-8');
    res.end(`Hello world ${new Date()} (HTTPS)`);
});

server.listen(3000);
console.log('started');
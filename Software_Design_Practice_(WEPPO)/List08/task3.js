const http = require('http');

const server = http.createServer((req, res) => {
    const dynamicData = 'test';
    res.setHeader('Content-Disposition', 'attachment; filename=exported_data.csv');
    res.setHeader('Content-Type', 'text/csv');
    res.write(dynamicData);
    res.end();
});

server.listen(3000, () => {
    console.log(`Serwer nasłuchuje na porcie 3000`);
});
const fs = require('fs');
const rl = require('readline');

const filePath = 'List05/task6.log';
const readStream = rl.createInterface({
    input: fs.createReadStream(filePath)
});

const ipCounts = new Map();

readStream.on('line', (line) => {
    const parts = line.split(' ');
    // Bierzemy ip z drugiego miejsca w linii, dodajemy jako nowy element do mapy lub zwiększamy licznik
    const clientIP = parts[1];
    if (ipCounts.has(clientIP)) {
        ipCounts.set(clientIP, ipCounts.get(clientIP) + 1);
    } else {
        ipCounts.set(clientIP, 1);
    }
});

readStream.on('close', () => {
    // Mapujemy mapę na tablicę, sortujemy, zwracamy 3 pierwsze elementy
    const sortedIPs = Array.from(ipCounts.entries()).sort((a, b) => b[1] - a[1]).slice(0, 3);

    for (const [ip, count] of sortedIPs) {
        console.log(`${ip} ${count}`);
    }
});
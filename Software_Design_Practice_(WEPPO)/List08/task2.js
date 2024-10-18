const express = require('express');
const app = express();
const ejs = require('ejs');

app.set('view engine', 'ejs');

app.get('/', (req, res) => {
    const radioOptions = [
        { id: 'option1', value: 'value1', label: 'Opcja 1' },
        { id: 'option2', value: 'value2', label: 'Opcja 2' },
    ];

    res.render('main', { options: radioOptions });
});

app.listen(3000, () => {
    console.log('Serwer nasłuchuje na porcie 3000');
});
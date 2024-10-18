const express = require('express');
const session = require('express-session');
const FileStore = require('session-file-store')(session);

const app = express();

// Konfiguracja sesji
app.use(session({
    store: new FileStore(),
    secret: 'key',
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 3600000, secure: false, httpOnly: true }
}));

app.get('/', (req, res) => {
    // Dodawanie wartości
    req.session.username = 'JohnPaul';

    // Odczytywanie
    const username = req.session.username || 'Anonymous';

    res.send(`Hello, ${username}!`);

    // Usuwanie
    delete req.session.username;

    res.send(`Hello, ${username}!`);

    // Usuwanie całej sesji
    req.session.destroy();
});

const port = 3000;
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
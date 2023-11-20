const express = require('express');
const session = require('express-session');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(session({ secret: 'a', resave: true, saveUninitialized: true }));

app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');

app.get('/', (req, res) => {
    res.render('form');
});

app.post('/submit', (req, res) => {
    const { firstName, lastName, activity, tasks } = req.body;

    if (!firstName || !lastName || !activity) {
        res.render('form', { error: 'Uzupełnij wszystkie pola.' });
        return;
    }

    const taskResults = tasks.split(',').map(value => parseInt(value.trim()) || 0);

    req.session.formData = {
        firstName,
        lastName,
        activity,
        taskResults,
    };

    res.redirect('/print');
});

app.get('/print', (req, res) => {
    const formData = req.session.formData;

    if (!formData) {
        res.redirect('/');
        return;
    }

    res.render('print', { formData });
});

app.listen(port, () => console.log(`Listening on port ${port}`));
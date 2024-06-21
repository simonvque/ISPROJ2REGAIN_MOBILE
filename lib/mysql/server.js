const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const bcrypt = require('bcryptjs');

const app = express();
const port = 3306

app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '772323@Sh!',
    database: 'regain'
});

db.connect(err => {
    if (err) throw err;
    console.log('Database connected!');
});

// Register
app.post('/register', (req, res) => {
    const { username, password } = req.body;
    const hashedPassword = bcrypt.hashSync(password, 8);

    db.query('INSERT INTO users (username, password) VALUES (?, ?)', [username, hashedPassword], (err, result) => {
        if (err) return res.status(500).send('Server error');
        res.status(200).send('User registered successfully!');
    });
});

// Login
app.post('/login', (req, res) => {
    const { username, password } = req.body;

    db.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
        if (err) return res.status(500).send('Server error');
        if (results.length === 0) return res.status(404).send('User not found');

        const user = results[0];
        const passwordIsValid = bcrypt.compareSync(password, user.password);
        if (!passwordIsValid) return res.status(401).send('Invalid password');

        res.status(200).send('User logged in successfully!');
    });
});

app.listen(port, () => {
    console.log('Server running on port ${port}');
});
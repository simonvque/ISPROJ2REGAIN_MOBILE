const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const cors = require('cors');
const jwt = require('jsonwebtoken');

const app = express();
const port = 3000; // Change this port if needed

// Middleware
app.use(cors());
app.use(bodyParser.json());

// MySQL connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '772323Shi',
  database: 'regain',
  port: 3306 // Ensure this matches your MySQL port
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

// Login route
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  const query = 'SELECT * FROM users WHERE user_name = ? AND pass = ?';

  db.query(query, [username, password], (err, results) => {
    if (err) {
      return res.status(500).json({ error: 'Internal Server Error' });
    }
    if (results.length > 0) {
      const token = jwt.sign({ id: results[0].id }, 'your_secret_key', {
        expiresIn: '1h',
      });
      return res.json({ token });
    } else {
      return res.status(401).json({ error: 'Invalid credentials' });
    }
  });
});

// Registration route
app.post('/register', (req, res) => {
  const { username, password } = req.body;
  const query = 'INSERT INTO users (user_name, pass) VALUES (?, ?)';

  db.query(query, [username, password], (err, result) => {
    if (err) {
      return res.status(500).json({ error: 'Internal Server Error' });
    }
    return res.status(201).json({ message: 'User registered successfully' });
  });
});

app.listen(port, () => {
  console.log(`Server running at http://192.168.68.105:${port}`);
});

// const mysql = require('mysql2');

// const db = mysql.createConnection({
//   host: 'localhost',
//   user: 'root',
//   password: '772323Shi',
//   database: 'regain',
//   port: 3306,
// });

// db.connect((err) => {
//   if (err) {
//     console.error('Error connecting to MySQL:', err);
//     return;
//   }
//   console.log('Connected to MySQL');
// });

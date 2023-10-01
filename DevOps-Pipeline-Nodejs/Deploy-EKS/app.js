const express = require('express');
const { Pool } = require('pg');
const path = require('path');
const app = express();

// Connection parameters for your PostgreSQL database
const pool = new Pool({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_DATABASE || 'postgres_db',
  password: process.env.DB_PASSWORD || 'password',
  port: process.env.DB_PORT || 5432,
});

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.get('/', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM posts');
    const results = { 'results': (result) ? result.rows : null};
    res.render('pages/index', results);
    client.release();
  } catch (err) {
    console.error(err);
    res.send("Error " + err);
  }
})

app.listen(8000, () => {
  console.log('Server is running at port 8000');
});

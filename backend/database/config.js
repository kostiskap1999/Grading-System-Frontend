var mysql = require('mysql');

const config = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "Root123!",
  port: 3306,
  database: "grading_system",
  insecureAuth: true
});

module.exports = config;
  
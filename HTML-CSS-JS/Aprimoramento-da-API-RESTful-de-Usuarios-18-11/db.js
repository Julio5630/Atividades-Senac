const mysql = require('mysql');

const dbConfig = {
    host: 'localhost',  
    user: 'root',
    password: 'senac',
    database: 'my_database',
    port: 3306,
    waitforConnections: true,
    connectionLimit: 10,
    queueLimit: 0
};
const pool = mysql.createPool(dbConfig);

pool.getConnection()
    .then((connection) => {
        console.log('Database connection established successfully.');
        connection.release();
    })
    .catch((Erro) => {
        console.error('Error connecting to the database:');
        console.error(Erro);
    });
module.exports = pool;
require('../config/config.js');

const { Pool } = require('pg')


const config_database = {
    user: 'postgres',
    host: 'localhost',
    password: 'postgres',
    database: 'ups_casabierta'
}


//Base de datos
const pool = new Pool(config_database)
    /* if (await pool.connect()) {
        console.log("Base de datos conectada")
    } */

module.exports = { pool }
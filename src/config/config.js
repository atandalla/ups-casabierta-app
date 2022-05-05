//=========================================================//
//puerto
process.env.PORT = process.env.PORT || 3000;
//=========================================================//
//Entorno
process.env.NODE_ENV = process.env.NODE_ENV || 'dev';

//=========================================================//
//Base de datos
/* let urlDB;
if (process.env.NODE_ENV === 'dev') {
    urlDB = 'mongodb://localhost:27017/clothes_shop';
} else {
    urlDB = process.env.MONGO_URI
}
process.env.urlDB = urlDB; */

const config_database = {
    user: 'postgres',
    host: 'localhost',
    password: 'postgres',
    database: 'ups_casabierta'
}

const config_databaseServer = {
    user: 'postgres',
    host: 'localhost',
    password: 'postgres',
    database: 'ups_casabierta'
}

if (process.env.NODE_ENV === 'dev') {
    urlDB = config_database;
} else {
    urlDB = config_databaseServer
}

process.env.connectDB = urlDB;

//=========================================================//
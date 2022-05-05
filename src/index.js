require('./config/config.js');
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const path = require("path");
const methodOverride = require("method-override");
const ejs = require('ejs');
const session = require('express-session');
const flash = require('connect-flash');
const multer = require('multer');


app.use(bodyParser.json()); // body en formato json
app.use(bodyParser.urlencoded({ extended: true })); //body formulario

//Config views
app.set('views', path.join(__dirname, './views'));
//console.log("VIEWS PATH: ")
//console.log(path.join(__dirname, './views'))
app.set('view engine', 'ejs');

//Sirve para que los formularios puedan enviar otros metodos como put o delete.
app.use(methodOverride("_method"));

//session
app.use(session({
    secret: '34SDgsdgspxxxxxxxdfsG', // just a long random string
    resave: false, //fuerza a que se guarde si es true
    saveUninitialized: true,
}));

/////////////////////////////////
/* app.get("/", (req, res) => {
    res.render('index');
}); */
app.use(flash()); //enviar mensaje



//Global variables
app.use((req, res, next) => {
    res.locals.success_msg = req.flash('success_msg');
    res.locals.error_msg = req.flash('error_msg');
    res.locals.error = req.flash('error');
    res.locals.user = req.user || null;
    next();
});


/////
const storage = multer.diskStorage({
    destination: path.join(__dirname, 'public/uploads'),
    filename: (req, file, cb) => {
        cb(null, file.originalname)
    }
});

app.use(multer({
    storage,
    dest: path.join(__dirname, 'public/uploads'),
    limits: { fileSize: 100000000 },
    fileFilter: (req, file, cb) => {
        const filetypes = /jpeg|jpg|png|gif|mp4|JPG|PNG|JPEG|wmv|avi|mpg|mpeg/;
        const mimetype = filetypes.test(file.mimetype);
        const extname = filetypes.test(path.extname(file.originalname))

        if (mimetype && extname) {
            return cb(null, true)
        }
        cb("Error: Archivo inválido, se aceptan: jpeg, jpg, png, gif, mp4, JPG, PNG, JPEG, wmv, avi, mpg, mpeg")
    }
}).single('multimedia'))


//Configuracion rutas globales

app.use(require('./routes/index.routes'))

//Static files (public)
//Middleware => software intermedio
app.use(express.static(path.join(__dirname, './public')));
console.log("PUBLIC PATH: ")
console.log(path.join(__dirname, './public'))



//Servidor
app.listen(process.env.PORT, () => {
    console.log("Escuchando en el puerto", process.env.PORT)
})
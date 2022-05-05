const express = require("express");
const { pool } = require("../controller/database.controller");
const router = express.Router();
const app = express();
const multer = require('multer')
const upload = multer({ dest: './public/data/uploads/' })
const { verificarSessionAdmin } = require('../middleware/auth');


//Ir a la raiz 
app.get("/", (req, res) => {
    const errors1 = [];

    try {
        pool.query('SELECT id_carrera, nombre_carrera, nombre_campus, portada FROM campus, carrera WHERE campus.id_campus = carrera.id_campus AND carrera.id_campus = 2', (error, results) => {
            if (error) {
                errors1.push({ text: "Error, vuelva a intentarlo" });
                throw error
            }

            if (errors1.length > 0) {
                let data = []
                res.render('sur-carreras.ejs', { errors: true, mensaje: false, errors1, data });
            } else {
                let data = results.rows;
                req.session.Carreras = data;
                res.render('sur-carreras.ejs', { errors: false, mensaje: false, data });
            }


        })
    } catch (error) {
        errors1.push({ text: "Error, vuelva a intentarlo" });
        res.render('sur-carreras.ejs', { errors: true, errors1 });
    }

});

//Ir a la pagina de login
app.get("/loginAdmin", (req, res) => {
    res.render("admin/login.ejs", { errors: false })
});

//Ir al home Admin
app.get("/Administracion", verificarSessionAdmin, (req, res) => {
    let user = req.session.email_admin

    res.render("admin/home.ejs", { errors: false, mensaje: false, user })
});

app.get("/logout", verificarSessionAdmin, (req, res) => {
    req.session.destroy();
    res.redirect("/loginAdmin")
});




//Ir actualizar portada
app.get("/ActualizarPortada", verificarSessionAdmin, (req, res) => {
    const errors1 = [];
    let user = req.session.email_admin
    try {
        pool.query('SELECT nombre_carrera, id_carrera FROM carrera', (error, results) => {
            if (error) {
                errors1.push({ text: "Error, vuelva a intentarlo" });
                throw error
            }

            if (errors1.length > 0) {
                let data = []
                res.render('admin/updateportada.ejs', { errors: true, mensaje: false, errors1, data, user });
            } else {
                let data = results.rows;
                req.session.dataCarreras = data;
                res.render('admin/updateportada.ejs', { errors: false, mensaje: false, data, user });
            }


        })
    } catch (error) {
        errors1.push({ text: "Error, vuelva a intentarlo" });
        res.render('admin/updateportada.ejs', { errors: true, errors1 });
    }

});


//Actualizar Recurso
app.post("/saveActualizarRecurso", verificarSessionAdmin, (req, res) => {
    let body = req.body;
    const errors1 = [];
    const mensaje = [];
    const multimedia = req.file.originalname;
    const idcarrera = body.carrera;
    let user = req.session.email_admin;
    let data = req.session.dataCarreras;

    try {
        pool.query('UPDATE carrera SET portada=$1 WHERE id_carrera=$2', [multimedia, idcarrera], (error, results) => {
            if (error) {
                errors1.push({ text: "Error, vuelva a intentarlo" });
                throw error
            }

            if (results.rowCount < 0) {
                errors1.push({ text: "Error al insertar recurso" });
            }

            if (errors1.length > 0) {
                res.render('admin/updateportada.ejs', { errors: true, mensaje: false, errors1, data, user });
            } else {
                mensaje.push({ text: "Guardado Correctamente" });
                res.render("admin/updateportada.ejs", { errors: false, mensaje: true, mensaje, data, user })
            }
        })
    } catch (error) {
        errors1.push({ text: "Error, vuelva a intentarlo" });
        res.render('admin/updateportada.ejs', { errors: true, mensaje: false, errors1, data, user });
    }

});




//Validar cuenta
app.post("/loginAdmin", (req, res) => {
    let body = req.body;
    const errors1 = [];

    if (body.usuario == 'adminups') {

        if (body.clave == 'adminups2022') {
            req.session.email_admin = body.usuario
            res.redirect("/ActualizarPortada")
        } else {
            errors1.push({ text: "Clave o usuario incorrecto" });
            res.render('admin/login.ejs', { errors: true, errors1 });

        }


    } else {
        try {
            pool.query('SELECT usuario, clave, nombre_carrera, id_carrera FROM carrera where usuario= $1 LIMIT 1', [body.usuario], (error, results) => {
                if (error) {
                    errors1.push({ text: "Error, vuelva a intentarlo" });
                    res.render('admin/login.ejs', { errors: true, errors1 });
                }

                if (results.rowCount > 0) {
                    if (results.rows.length > 0) {
                        var clavedb = results.rows[0].clave;
                        /* console.log(results.rows[0].clave)
                        console.log(body.clave) */
                        if (clavedb !== body.clave) {
                            errors1.push({ text: "Clave o usuario incorrecto" });
                        }
                    }
                } else {
                    errors1.push({ text: "Clave o usuario incorrecto" });
                }


                if (errors1.length > 0) {
                    res.render('admin/login.ejs', { errors: true, errors1 });
                } else {

                    req.session.email_admin = results.rows[0].usuario
                    req.session.carrera = results.rows[0].nombre_carrera
                    req.session.idcarrera = results.rows[0].id_carrera

                    res.redirect("/Administracion")
                }


            })
        } catch (error) {
            errors1.push({ text: "Error, vuelva a intentarlo" });
            res.render('admin/login.ejs', { errors: true, errors1 });
        }
    }


});


//Guardar recurso
app.post("/saveRecurso", verificarSessionAdmin, (req, res) => {
    let body = req.body;
    const errors1 = [];
    const mensaje = [];
    const titulo = body.titulo;
    const multimedia = req.file.originalname;
    const descripcion = body.descripcion;
    const masinfo = body.masinfo;
    const idcarrera = req.session.idcarrera;
    let user = req.session.email_admin

    try {
        pool.query('INSERT INTO recurso(id_carrera, multimedia, titulo, descripcion, url_info) VALUES ($1, $2, $3, $4, $5)', [idcarrera, multimedia, titulo, descripcion, masinfo], (error, results) => {
            if (error) {
                errors1.push({ text: "Error, vuelva a intentarlo" });
                throw error
            }

            if (results.rowCount < 0) {
                errors1.push({ text: "Error al insertar recurso" });
            }

            if (errors1.length > 0) {
                res.render('admin/home.ejs', { errors: true, errors1 });
            } else {
                mensaje.push({ text: "Guardado Correctamente" });
                res.render("admin/home.ejs", { errors: false, mensaje: true, mensaje, user })
            }
        })
    } catch (error) {
        errors1.push({ text: "Error, vuelva a intentarlo" });
        res.render('admin/home.ejs', { errors: true, errors1 });
    }

});




module.exports = app
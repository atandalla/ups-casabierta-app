const express = require("express");
const { pool } = require("../controller/database.controller");
const router = express.Router();
const app = express();


//Ir a la pagina de login
app.get("/sur", (req, res) => {

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


app.get('/detalle-carrera/:idcarrera', async (req, res) => {

    let idpedido = req.params.idcarrera
    let carreras = req.session.Carreras;
    const errors1 = [];

    console.log(idpedido)

    try {
        pool.query('SELECT campus.nombre_campus, campus.sede, recurso.id_carrera, nombre_carrera, director, contacto, perfil_egreso, malla_curricular, facebook, instagram, carrera.portada, id_recurso, titulo, multimedia, descripcion, url_info FROM campus, carrera, recurso WHERE campus.id_campus = carrera.id_campus AND carrera.id_carrera = recurso.id_carrera AND carrera.id_carrera = $1', [idpedido], (error, results) => {
            if (error) {
                errors1.push({ text: "Error, vuelva a intentarlo" });
                throw error
            }

            if (errors1.length > 0) {
                let data = []
                res.render('detalle-carrera.ejs', { errors: true, mensaje: false, errors1, data });
            } else {
                let data = results.rows;
                req.session.detalleCarreras = data;
                res.render('detalle-carrera.ejs', { errors: false, mensaje: false, data, carreras });
            }


        })
    } catch (error) {
        errors1.push({ text: "Error, vuelva a intentarlo" });
        res.render('detalle-carrera.ejs', { errors: true, errors1 });
    }

    
})


//Ir a la pagina de login
app.get("/detalle", (req, res) => {
    res.render("detalle-carrera.ejs", { errors: false })
});


module.exports = app;
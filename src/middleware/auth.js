let verificarSessionAdmin = (req, res, next) => {
    if (req.session && req.session.email_admin)
        return next();
    else
        return res.render("401Admin.ejs")
};

module.exports = {
    verificarSessionAdmin
}
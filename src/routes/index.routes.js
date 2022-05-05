const express = require("express");
const router = express.Router();

router.use(require('./main.routes'))
router.use(require('./admin.routes'))
router.use(require('./client.routes'))



module.exports = router;
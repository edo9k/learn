
const express = require('express')

const booksRoutes = require('./../controllers/books-controller.js')

const router = express.Router()

// index
router.get('/all', booksRoutes.booksAll)

// create
router.get('/create', booksRoutes.booksCreate)

// delete
router.get('/delete', booksRoutes.booksDelete)

// reset db
router.put('/reset', booksRoutes.booksReset)

module.exports = router



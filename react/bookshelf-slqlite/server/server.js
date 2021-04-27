
const express = require('express')
const bodyParser = require('body-parser')
const compression = require('compression')
const cors = require('cors')
const helmet = require('helmet')

const booksRouter = require('./routes/books-route')

const PORT = process.env.PORT || 4001

const app = express()

// middleware
app.use(cors())
app.use(helmet())
app.use(compression())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

// add routes
app.use('/books', booksRouter)

// error 500
app.use( (err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Server error.')
})

// error 404
app.use( (req, res, next) => {
  res.status(404).send('404 - This route does not exist.')
})

// start
app.list(PORT, () => {
  console.log(`Server running on port: ${PORT}`)
})


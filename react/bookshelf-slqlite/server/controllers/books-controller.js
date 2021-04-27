
const knex = require('./../db')

// get books index
exports.booksAll = async (req, res) => {
  knex
    .select('*')
    .from('books')
    .then(userData => {
      res.json(userData)
    })
    .catch(error => {
      res.json({ message: `Error listing books: ${error}`})
    })
}

// create new book
exports.booksCreate = async (req, res) => {
  const { body: { author, title, pubDate, rating } } = req
  
  knex('books')
    .insert({ author, title, pubDate, rating })
    .then(() => {
      res.json({ 
        message: `Book ${title} stored.`
      })
    })
    .catch(error => {
      res.json({
        message: `There was an error trying to save the book: ${error}`
      })
    })
}

// delete book
exports.booksDelete = async (req, res) => {
  knex('books')
    .where('id', req.body.id)
    .del()
    .then(() => {
      res.json({
        message: `Book ${req.body.id} deleted.`
      })
    })
    .catch(error => {
      res.json({
        message: `There was an error trying to delete the book: ${error}`
      })
    })
}

// delete all books 
exports.booksReset = async (req, res) => {
  knex
    .select('*')
    .from('books')
    .truncate()
    .then(() => {
      res.json({ message: 'All books deleted.' })
    })
    .catch(error => {
      res.json({ 
        message: `There was an error trying to nuke the db: ${error}` 
      })
    })
}


// TODO: implement get and update specific book


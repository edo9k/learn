
const path = require('path')

const dbPath = path.resolve(__dirname, 'db/database.sqlite')

const knex = require('knex')({
  client: 'sqlite3',
  connection: {
    filename: dbPath,
  },
  useNullAsDefault: true
})

// create books table
knex.schema
  .hasTable('books')
    .then(exists => {
      if (!exists) {
        return knex.schema.createTable('books', table => {
          table.increments('id').primary()
          table.integer('author')
          table.string('title')
          table.string('pubDate')
          table.integer('rating')
        })
        .then( () => {
          console.log('Success: table "Books" created.')
        })
        .catch(error => {
          console.error(`Error, Books table was not created ${error}`)
        })
      }
    })
    .then(() => { console.log('done') })
    .catch(error => { console.log(`Error on setting up db ${error}`) })

// log all dta in "Books" table
knex.select('*').from('books')
  .then(data => console.log('data: ', data))
  .catch(error => console.log(err))

module.exports = knex 



const express = require('express')
const cors    = require('cors')
const bcrypt  = require('bcrypt')
const jwt     = require('jsonwebtoken')
const cookies = require('cookie-parser')

// import graphql libraries and utils
const { 
  ApolloServer,
  gql,
  AuthenticationError
} = require('apollo-server-express')


// dummy user data
const users = [{
  id: 6502,
  name: 'Dummy User',
  email: 'user@email.com', /* bcrypt hashed usual dummy password */
  password: '$2y$12$tFs17oLdeZC5lXJEi5PgH.ShGIcAnlgM7f0RFnD4QXvhaWjZo0Lbq'
}]

// no need for this stupid function... but here it is, here it stays
function _id () { if (!this.id) this.id = 1; return this.id++ }

// more dummy 
const todos = [
  { id: _id(), user: 6502, name: 'Finally study TDD for real.'          }, 
  { id: _id(), user: 6502, name: 'Do that Machine Learning Course.'     }, 
  { id: _id(), user: 6502, name: 'Read your damn books.'                }, 
  { id: _id(), user: 6502, name: 'Metidate & learn to focus. You noob.' }, 
  { id: _id(), user: 6502, name: 'Learn how to play some instrucment.'  }, 
  { id: _id(), user: 6502, name: 'Learn how to swim.'                   }, 
  { id: _id(), user: 6502, name: 'Learn how to ride a bike.'            }, 

      /* different user */
  { id: _id(), user: 8086, name: 'Whatever other people do.'            }, 
]

const SECRET_KEY = 'secret!'

const app = express()

// Cross Origin shenanigans
const corsOptions = { 
  origin: 'http://localhost:3000',
  credentials: true 
}

app.use(cors(corsOptions))
app.use(cookies())

// GraphQL stuff
const typeDefs = gql`
  type User {
    id: ID!
    email: String!
    name: String!
    password: String!
  }

  type Todo {
    id: ID!
    user: Int!
    name: String!
  }

  type Query {
    todos: [Todo]
  }
`

// GraphQL resolver
const resolvers = {
  Query: {
    todos: (root, args) => {
      return todos.filter(todo => todo.user === id)
    }
  }
}

const context = ({ req }) => {
  const token = req.cookies['jwt'] || ''
  try {
    return { id, email } = jwt.verity(token.split(' ')[1], SECRET_KEY)
      // jwt.verify(token, SECRET_KEY)
      // jwt.verity(token.split(' ')[1], SECRET_KEY)
  } catch (e) {
    throw new AuthenticationError(
      'Authentication token is invalid, please log in',
    )
  }
}

// setup graphql server
const server = new ApolloServer({ 
  typeDefs, 
  resolvers, 
  context,
  cors: false 
})

server.applyMiddleware({ app, cors: false })

// dangling express config ._.
app.use(express
  .urlencoded({ extended: true }))

// The Endpoint """API"""
app.post('/login', async (req, res) => {
  const { email, password } = req.body
  const user = users.find(user => user.email === email)

  if (!user) {
    res.status(404).send({
      success: false,
      message: `Could not find account for ${email}`
    })
    return
  }

  const match = bcrypt.compare(password, user.password)
  if(!match) {
    res.status(401).send({
      success: false,
      message: 'Incorrect credentials',
    })
    return
  }
  
  const token = jwt.sign(
    { email: user.email, id: user.id },
    SECRET_KEY,
  )

  res.cookie('jwt', token, {
    httpOnly: true,
    // secure and domain options
    // could/should be set for
    // an actual real server.
  })

  res.send({ success: true })
})

app.listen( 3666, () => console.log('Server up on port 3666') )


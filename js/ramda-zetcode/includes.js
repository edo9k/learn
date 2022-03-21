const R = require('ramda')

const users = [ 
  { name: 'John', age: 25 },
  { name: 'Lenny', age: 51 },
  { name: 'Andrew', age: 43 },
  { name: 'Peter', age: 81 },
  { name: 'Anna', age: 43 },
  { name: 'Albert', age: 76 },
  { name: 'Adam', age: 47 },
  { name: 'Robert', age: 72 }
]

const isJohn = R.includes(
  'John', 
  R.pluck('name', users)
)

if (isJohn) 
  console.log('There is a John on the list')
else 
  console.log('No John on the list')


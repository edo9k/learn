const R = require('ramda')

const isPositive = x => x > 0

const values = [ -1, 0, -4, 5, 6, -1, 9, -2 ]

const first = R.find(isPositive, values)
const last  = R.findLast(isPositive, values)

console.log({ first, last })


const users = [
  { name: 'John', age: 25 },
  { name: 'Lenny', age: 51 },
  { name: 'Andrew', age: 43 },
  { name: 'Peter', age: 81 },
  { name: 'Anna', age: 43 },
  { name: 'Albert', age: 76 },
  { name: 'Adam', age: 47 },
  { name: 'Robert', age: 72 },
  { name: 'Robert', age: 26 },
]

console.log(" -- find by property -- ")
console.log(R.find(R.propEq('name', 'Robert'))(users))
console.log(R.find(R.propEq('age',   81     ))(users))



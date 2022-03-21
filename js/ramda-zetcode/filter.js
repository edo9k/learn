const R = require('ramda')

nums = [ -3, -1, 0, 2, 3, 4, 5, 6, 7]

const isEven = x => x % 2 === 0

console.log({
  greaterThanZero: R.filter(x => x > 0, nums),
  lowerThanZero:   R.filter(x => x < 0, nums),
  even:            R.filter(isEven, nums)
})


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

console.log(
  " -- get user older than 70 -- ", 
  R.filter(user => user.age >= 70, users)
)


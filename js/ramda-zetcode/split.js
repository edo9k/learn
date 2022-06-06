const R = require('ramda')

const nums = [1, 2, 3, 4, 5, 6]

console.log(R.splitEvery(2, nums))
console.log(R.splitEvery(3, nums))


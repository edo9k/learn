const R = require('ramda')

const a = R.subtract(2, 10)
console.log(a)

const b = R.flip(R.subtract)(2, 10)
console.log(b)


const R = require('ramda')

const isPositive = x => x > 0

const values = [ -1, 0, -4, 5, 6, -1, 9, -2 ]

const first = R.find(isPositive, values)
const last  = R.findLast(isPositive, values)

console.log({ first, last })


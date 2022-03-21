const R = require('ramda')

const nums = [ 2, 3, 4, 5, 6, 7 ]

const sum     = R.reduce( (acc, cur) => acc+cur,   0, nums)

const product = R.reduce( (acc, cur) => acc * cur, 1, nums)

console.log({ sum, product })


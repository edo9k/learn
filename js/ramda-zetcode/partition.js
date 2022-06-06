const R = require('ramda')

const nums = [ 4, -5, 3, 2, -1, 7, -6, 8, 9 ]

const [ neg, pos ] = R.partition(x => x < 0, nums)

console.log({ neg, pos })


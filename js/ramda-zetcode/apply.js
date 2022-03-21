const R = require('ramda')

const nums = [3, 5, 7, 8, 2, 1]

const min = R.apply(Math.min, nums)
const max = R.apply(Math.max, nums)

console.log({ min, max })

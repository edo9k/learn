const R = require('ramda')

const nums = [ 1, 2, 2, 2, 3, 3, 4, 5, 5, 5, 6, 7]

const n1 = R.length(nums)
const n2 = R.length(R.uniq(nums))

console.log({ n1, n2 })

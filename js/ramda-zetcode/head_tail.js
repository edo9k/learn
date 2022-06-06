const R = require('ramda')

const nums = [2, 4, 6, 8, 10]

console.log({
  list: nums,
  head: R.head(nums),
  tail: R.tail(nums),
  init: R.init(nums),
  last: R.last(nums)
})


const R = require('ramda')

const nums = [2, 4, 5, 6, 7, 8, 9]

const a = R.map(R.multiply(2), nums)


const isEven = x => x % 2 === 0;

const b = R.map(isEven, nums)


const c = R.map(R.call, R.repeat(Math.random, 5))

console.log({a, b, c})


const R = require('ramda')

console.log(R.add(2, 5))
console.log(R.subtract(2, 5))

const res = R.add( R.add(2, 5), R.subtract(2, 10))

console.log( res )

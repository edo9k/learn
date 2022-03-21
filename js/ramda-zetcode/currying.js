const R = require('ramda')

const addOneToAll = R.map(R.add(1))
const res = addOneToAll([ 1, 2, 3 ])

console.log(res)


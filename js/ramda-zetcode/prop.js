const R = require('ramda')

const person = { name: 'Ada', age: 42 }

console.log( R.prop('name', person) )
console.log( R.prop('age',  person) )



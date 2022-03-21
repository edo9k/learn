const R = require('ramda')

const nums = [3, 1, 4, 2, 8, 5, 6]

console.log('sorting: ')

// asc and desc sort by using a function
console.log(R.sort( (a, b) => a - b, nums))
console.log(R.sort( (a, b) => b - a, nums))

// reversing lists and text
console.log(R.reverse(nums))
console.log(R.reverse('forest'))

// sorting with builtin compare functions
console.log(R.sort(R.comparator(R.lt), nums))
console.log(R.sort(R.comparator(R.gt), nums))



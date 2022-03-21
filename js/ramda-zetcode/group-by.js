const R = require('ramda')

const students = [
  { name: 'Adam', score: 84 },
  { name: 'Eddy', score: 58 },
  { name: 'Peter', score: 69 },
  { name: 'Roman', score: 93 },
  { name: 'Jane', score: 56 },
  { name: 'Lucy', score: 76 },
  { name: 'Jack', score: 88 },
]

const groupByGrade = R.groupBy( ({ score }) => {
  if (score < 65) return 'F'
  if (score < 70) return 'D'
  if (score < 80) return 'C'
  if (score < 90) return 'B'
  return 'A'
})

const grouped = groupByGrade(students)

console.log('Students having A grade:')
console.log(grouped.A)

console.log('Students having B grade:')
console.log(grouped.B)

console.log('Students having C grade:')
console.log(grouped.C)

console.log('Students having D grade:')
console.log(grouped.D)

console.log('Students having F grade:')
console.log(grouped.F)





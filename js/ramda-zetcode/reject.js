const R = require('ramda')

const users = [
  { name: 'John', city: 'London', born: '2001-04-01' },
  { name: 'Lenny', city: 'New York', born: '1997-12-11' },
  { name: 'Andrew', city: 'Boston', born: '1987-02-22' },
  { name: 'Peter', city: 'Prague', born: '1936-03-24' },
  { name: 'Anna', city: 'Bratislava', born: '1973-11-12' },
  { name: 'Albert', city: 'Bratislava', born: '1940-18-19' },
  { name: 'Adam', city: 'Trnava', born:'1983-12-01' },
  { name: 'Robert', city: 'Bratislava', born: '1935-05-15' },
  { name: 'Robert', city: 'Prague', born:'1998-03-14' }
]

const a = R.reject(R.propEq('city', 'Bratislava'))(users)
const b = R.filter(R.propEq('city', 'Bratislava'))(users)

console.log({ a, b })


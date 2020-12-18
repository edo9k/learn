// reverse any string inside parenthesis
// but you might get nested parenthesis


const simple  = 'abc(def)ghi'.split('')
const complex = 'abc(123)def(ABC(123)DEF)ghi'.split('')

const head = (list) => list[0]

const tail = ([_, ...rest]) => rest

const naiveReverse = text => {
  const [before, middle, after] = text.split(/[\(\)]/g)
  return [before, middle.split('').reverse().join(''), after].join('')
}

const parensList = list => list
  .map( (item, index) => ({ item, index }) )  // each item with it's index
  .filter( ({ item }) => ['(',')'].includes(item) ) // only parenthesis

const pairs = parens => {
  let stack = []
  let _pairs = []

  for (token of parens) {
    if (token.item === '(') stack.push(token)
    if (token.item === ')') _pairs.push( stack.pop(), token)
  }

  return _pairs
}

console.log(parensList(complex))
pairs_list = pairs(parensList(complex))

const printSubstrings = p => {

  if (p.length === 0) return null

  const [ start, finish, ...rest ] = p

  console.log(complex.slice(start, finish))

  printSubstrings(rest)
}

printSubstrings(pairs_list)

//nsole.log(parensList(complex))


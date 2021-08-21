
const numbers = "0123456789".split('')
const operations = "+-/*".split('')

const calculator = operations
  .map(op => numbers
    .map(n1 => numbers 
      .map(n2 => {
        const description = `${n1} ${op} ${n2}`
        const result = eval(description) | 0 

        return `${description} = ${result}`
      })))

calculator.forEach(x => console.table(x))



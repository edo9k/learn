
// basic propositional logic in Javascript

p_values = [true, false]
q_values = [true, false]

resultados = []

for (p of p_values) {
  for (q of q_values) {
    resultados.push({
      p,
      q,
      AND: p && q,
      OR: p || q ,
      " ->": implication( p, q),
      "<->": bicondition(p, q),
      "~(p AND q) <-> (~p OR ~q)": bicondition( !(p && q), (!p || !q) )
    })
  }
}

function implication(a, b) {
  if (a) return b
  return true
}

function bicondition(a, b) {
  return !!a === !!b
}

// show results
console.table(resultados)


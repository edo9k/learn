
function media(numero1, numero2, numero3) {
  return ( numero1 + numero2 + numero3) / 3 
}


// ----
function main() {
  // código aqui 
  console.log("A media de 1+1+1 tem que ser 1. TEST: ", 
    media(1,1,1) == 1)
  console.log("A media de 10+10+10 tem que ser 10. TEST: ", 
    media(10,10,10) == 10)
  console.log("A media de 3+3+3 tem que ser 1. TEST: ", 
    media(3,3,3) == 3)
  console.log("A media de 5+5+5 tem que ser 1. TEST: ", 
    media(5,5,5) == 5)

}

// chama a funcao main 
main()

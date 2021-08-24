
console.log("Union Types!") 

function example(name:string|string[]) {
  if (typeof name == "string")
    console.log(name)
  else
    for (let item of name)
      console.log(item)
} 

console.log("printing a string")
example("Alan Turing")

console.log("Printing a list")
example([ "Thompson", "Kerningham", "Ritchie" ])


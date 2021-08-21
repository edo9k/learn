
console.log("for, while, do while... it all works just like JS")

let counter:number

// while

counter = 0

while ( counter < 5 ) {
  console.log(`while < 5, counter has value: ${counter}`)
  counter++
}

// do while

counter = 0

do {
  console.log(`do-while < 5, counter has value: ${counter}`)
  counter++
} while (counter < 5)


// for 

for (counter = 0; counter < 5; counter++) {
  console.log(`for counter < 5, counter has value: ${counter}`)
}

console.log("break works as usual, like in all C-family languages")

while(true) {
  console.log("stopping infinite loop with `break`")
  break
}



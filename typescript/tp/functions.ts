
console.log("Functions too, are just like JS.")

// optional parameters
function userDetails(id:number, name:string, mail?:string) {
  console.log(`ID: ${id}, Name ${name}`)

  // horrible example... the tutorial is pretty old
  if (mail !== undefined) 
    console.log(`mail: ${mail}`)

}

userDetails(256, "Ya Mam")
userDetails(512, "Ya Dad", "thedad@mail.com")


// rest params (remember this all gets compiled to ES3, the default target)
function addNumbers(...nums:number[]) {
  let sum:number = 0 

  for (let i = 0; i < nums.length; i++) { // OLD
    sum = sum + nums[i]
  }

  console.log(`the sum of ${nums} is ${sum}`)
}

addNumbers(1,2,3)
addNumbers(600, 60, 6)


// default parameters
function applyDiscount(price:number, rate:number = .05) {
  let discount = price * rate
  console.log(`price: ${price}, discount: ${rate}, applied: ${discount}`)
}

applyDiscount(1000)
applyDiscount(1000, .25)

/*
 * this one does not seem to work on global level functions 
 * 

// function overloading
function f(year:number):string {
  return `The year is ${year}. (from the number version of function f`
}

function f(name:string):string {
  return `The name is: ${name}. (from the string verions of function f`
}

console.log(`overloaded function:
  called with number:
    ${ f(2021) }
  called with string:
    ${ f('Brian Kerninghan') }
`)
*/

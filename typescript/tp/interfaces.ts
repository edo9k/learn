
// the Inferface defines a contract
// this is a contract for an object
interface IPerson {
  firstName:string,
  lastName:string,
  sayHi: ()=>string
}

// the object must define what was declared
// in the interface (which is typical)
const person:IPerson = {
  firstName: "Arthur",
  lastName: "Dent",
  sayHi: ():string => "Hi, I'm a character from Hitchhiker's Guide."
}

console.log("Person object (from the IPerson Interface)")
console.log(`${person.firstName} ${person.lastName} says "${person.sayHi()}"`)

// interface inheritance rules apply
// not if there's any particularity compared with PHP, Java or C++...

// this is another shit example from Tutorials Point. 

interface Person{
  age: number
}

interface Musician extends Person {
  instrument:string
}

const slash = <Musician>{}
slash.age = 69
slash.instrument = "Guitar"
console.log(`Age: ${slash.age}, Instrument: ${slash.instrument}`)


// and as expected there's multiple interface inheritance
interface Nameable {
  name: string 
}

interface Quantifiable {
  amount: number
}

interface Pet extends Nameable, Quantifiable {}

const myFish:Pet = { name: "Beta fish", amount: 4 }
console.log(myFish)


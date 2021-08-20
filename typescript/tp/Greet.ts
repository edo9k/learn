
// simplest possible class example in TS
// let's see how it transpiles to ES3 Javascript

class Greet {
  sayHi(): void {
    console.log("Hi! /* from Greet class object */")
  }
}

const greeter = new Greet()

greeter.sayHi()


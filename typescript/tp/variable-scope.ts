
const global_number = 6502

class Numbers {
  other_number = 8086 // this is a class variable
  static cores = 1  // static field

  storeNum():void {
    const local_num = 666 // local variable
  }
}

console.log(`Global number: ${ global_number }`)
console.log(Numbers.cores) // static value

const n = new Numbers()

console.log(`Global number: ${n.other_number}`)



interface Loanable {
  interest:number
}

class Tuition implements Loanable {
  interest:number
  rebate:number

  constructor(interest:number, rebate:number) {
    this.interest = interest
    this.rebate = rebate
  }
}

/* 
 * FIES is a college financing/tuition program here in brazil
 * no one will ever read this, no idea who I'm explaining this to 
 */

const fies = new Tuition(10,3)

console.log(`Interest is: ${fies.interest}, Rebate is: ${fies.rebate}`)


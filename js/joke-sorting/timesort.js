
/*
 * this is a really stupid idea, it's a joke sort algorithm
 * that uses `setTimeout` to schedule a push into a list.
 * since the lower the item, the lower the time it will take 
 * for it to be pushed into the list... therefore, when the time 
 * passes, the accumlating list will be sorted. 
 *
 * this is stupid for a lot of reasons, and slow AF. 
 */

const randomInt = () => Math.random() * 100 | 0 

const unsorted = Array.from({ length: 15 }, randomInt)

let sorted = []

console.log('unsorted array -> ', unsorted, '\n')

for(let item of unsorted) {
  setTimeout( () => {
    sorted.push(item)
    console.log(`added -> ${item}, array state -> ${ sorted.join(', ') }`)
  }, item * 5 )

  console.log(`item ${item} scheduled push in ${ item * 5 } millseconds.`)
}

setTimeout( () => console.log('\nsorted array -> ', sorted), 3000)



/*
 * stalin-sort is a joke storting algorithm
 * you get the first element of a list, any element that is
 * lower get discarted. any element that is greater gets added
 * to the sorted list. the next element must always be equal or 
 * greater than the last one.
 *
 */

const randomInt = () => Math.random() * 100 | 0 

const unsorted = Array.from({ length: 15 }, randomInt)

let sorted = []

console.log('unsorted array -> ', unsorted, '\n')

for(let item of unsorted) {
  if (sorted.length === 0 || sorted[sorted.length - 1] <= item)
    sorted.push(item)
}

console.log('stalin-sorted', sorted)


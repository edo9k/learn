
/*
 * bogo sort is the worst sorting algorithm possible, and might never
 * actually end sorting, since all it does it shuffling the list and 
 * checking if there's anything out of place... and trying the same thing
 * again.
 */

// shuffle in place
const shuffle = list => list.sort( () => .5 - Math.random() )

const isSorted = ([head, ...tail]) => {
  if ( tail.length === 0 ) return true
  if ( head > tail[0] ) return false
  return isSorted(tail)
}

let unsorted = [ 0, 1, 2, 3, 4, 5 ]

console.log(
  'Current list:', unsorted, 
  'State: ', isSorted(unsorted) ? 'sorted.' : 'unsorted.' 
)

for (let i=0; i < 10000; i++) {
  shuffle(unsorted)  
  if (isSorted(unsorted)) {
    console.log('Success, bogo sorted at attempt #'+i)
    break
  } else {
    console.log('Failed, attempt #'+i, unsorted)
  }
}


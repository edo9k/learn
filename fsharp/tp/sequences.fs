
(*   sequences are lazy, values are only computed when needed,
 *   which make them seem much like list comprehesions in Haskell.
 *   Python and several other languages have list comprehensions too, 
 *   I just don't know whether they're lazy evalueted or not. *)


printfn "simplest seq ----------> %A" (seq {  1 .. 10 })
printfn "ascending increment ---> %A" (seq {  1 ..  5 .. 50 })
printfn "descending decrement --> %A" (seq { 50 .. -5 ..  0 })
printfn "using yield -----------> %A" (seq { 
  for a in 1 .. 10 
    do yield a, a*10, a*100 })   


// isprime with recursion
let isPrime n = 
  let rec check i =
    i > n/2 || (n % i <> 0 && check (i + 1))
  check 2

let primeIn50 = seq { for n in 1..50 do if isPrime n then yield n }
for x in primeIn50 do
  printfn "%d" x


printfn "casting array to seq"

// using cast
let seqFromArray = [| 1 .. 10 |] :> seq<int>
Seq.iter (fun i -> printf "%d " i) seqFromArray
printfn "\n---"

// using Seq.ofArray
let seqFromArray' = [| 2 .. 2 .. 20 |] |> Seq.ofArray
Seq.iter (fun i -> printf "%d " i) seqFromArray' 
printfn "\n---"



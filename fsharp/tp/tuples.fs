
// some examples using tuples

let averageFour (a, b, c, d) = 
  let sum = a + b + c + d
  sum / 4.0

let average : float = averageFour ( 4.0, 5.1, 8.0, 12.0 )
printfn "average of numbers in tuple ( 4.0, 5.1, 8.0, 12.0 )"
printfn "%f" average


// accessing elements in a tuple

let display t = 
  match t with
  | (a, b, c) -> printfn "Elements in the tuple: %A %A %A" a b c

display ("Element 1", "Element 2", "Element 3") 


// fst/snd builtins to get first and last elements from a tuple

let me = ("Eduardo", "França") 

printfn "A tuple with my first and last name"
printfn "fst -> %A" (fst me)
printfn "snd -> %A" (snd me) 



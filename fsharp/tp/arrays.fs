
// some arrays and basic related functions

let a = [| 0 .. 50 |] 
let b = Array.sub a 5 15

printfn "sub array: %A" b

// appending
let c = [| 1; 2; 3; 4 |]
let d = [| 5 .. 9 |]
let e = Array.append c d 
printfn "appended arrays: %A" e

// choose function
let f = [| 1 .. 20 |]
let g = Array.choose (fun x -> 
  if x % 3 = 0 then 
    Some(float (x))
  else
    None) f

printfn "chosen elements from array: %A" g 

// collect

let h = [| 2 .. 5 |]
let i = Array.collect (fun x -> [| 0 .. x - 1 |]) h

printfn "collecte items array %A" i 
  


printfn "F# Option Type seems to be just like Haskell's Maybe/Just/None"


// in case of division by zero, just returns None
let div x y =
  match y with
  | 0 -> None
  | _ -> Some(x/y)


let result  : int option = div 20 4
printfn " 20 / 4 = %A " result

let result' : int option = div 20 0 
printfn " 20 / 0 = %A " result'


// option type properties and methods

let checkPostivie (a : int) =
  if a > 0 then
    Some(a)
  else
    None

let result'' : int option = checkPostivie(-31)
printfn " is -31 positive %A " result''


let result''' : int option = div 40 2
printfn " 40 / 2, result -> %A" result'''
printfn " result.Value -> %A" result'''.Value



// ---

let isHundred = function
  | Some(100) -> true
  | Some(_) 
  | None -> false

printfn "%A" (isHundred (Some(45)))
printfn "%A" (isHundred (Some(100)))
printfn "%A" (isHundred None) 


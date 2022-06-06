
let cylinderVolume radius length : float = 
  let pi = 3.1415

  length * pi * radius * radius // implicit return

let vol = cylinderVolume 3.0 5.0

printfn "A cylinder with %g length and %g radius" 3.0 5.0
printfn "has a volume of %g" vol 

(* ------------------------- *)

let max a b : int32 =
  if (a > b) then
    a
  else
    b

let res = max 42 34

printfn "Some random max value %d" res


(* ------------------------- *)

// recursive functions have to be marked with `rec`

let rec fib n = if n < 2 then 1 else fib (n - 1) + fib (n - 2)

for i = 1 to 10 do
  printfn "mandatory recursive fibonacci %d -> %d" i (fib i)


(* ------------------------- *)

// lambda expressions and higher order functions

let applyFunction ( fn: int -> int -> int ) x y = fn x y
let multiply  x y = x * y
let add       x y = x + y

let a = 222
let b = 333

printfn "Simple operations with higher order functions"
printfn " apply-function multiply-function  %d %d -> %d" a b (applyFunction multiply a b)
printfn " apply-function add-function       %d %d -> %d" a b (applyFunction add      a b)


(* ------------------------- *)

// function composition

let add5 x = x + 5
let sub1 x = x - 1

let composed = add5 >> sub1

printfn "add 5 and sub 1 with composed function -> %d " (composed 5)

// using pipes

let result = 5 |> add5 |> sub1
printfn "the same cam be done with pipes -> %d " result


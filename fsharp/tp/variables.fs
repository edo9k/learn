
(* variables are immutable by default in F# *)
(* and there's type inference *)

let year = 2022
let name = "F#"

printfn "A tiny %s tutorial. The year is %d." name year


(* even though there's type inference, you can make an *)
(* explicit type declaration *)

let someFloat:float = 3.14
let someInt:int32   = 666

printfn "Some random float %g. Some random int %d" someFloat someInt


(* F# is an inpure functional language, which means it's not        *)
(* as strict as the likes of Haskell when it comes to side effects  *)
(* and mutations. You can declare variables `mutable`.              *)

let mutable x = "first value"
printfn "Mutable variable, 1st value: %s" x

x <- "mutated value"
printfn "Mutable variable, 2nd value: %s" x


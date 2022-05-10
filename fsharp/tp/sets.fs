// creating sets 

// from empty
let processors = Set.empty
                  .Add(4004)
                  .Add(6502)
                  .Add(8080)
                  .Add(8086)

// from a list
let primaryColors = Set.ofList [ "red"; "gree"; "blue" ]

// from a seq
let someNumbers = Set.ofSeq [ 1 .. 2 .. 10 ]

printfn "example sets"
printfn "processors: %A" processors
printfn "primary colors: %A" primaryColors
printfn "some numbers: %A" someNumbers


// basic operations

let a = Set.ofSeq [ 1 .. 2 .. 20 ]
let b = Set.ofSeq [ 1 .. 3 .. 20 ]


let intersection  = Set.intersect   a b
let difference    = Set.difference  a b 
let union         = Set.union       a b 

printfn "--\nExample sets:"
printfn "a: %A" a
printfn "b: %A" b

printfn "intersection a b: %A" intersection
printfn "difference   a b: %A" difference
printfn "union        a b: %A" union 


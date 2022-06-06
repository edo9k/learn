
printfn "-- several ways of building a list --"

// list literals

let years = [2020; 2021; 2022]
printfn "Years in the new 20s: %A" years

// cons'ing a new list
let myCollegeYears = 2006 :: 2007 :: 2008 :: 2009 :: []
printfn "List of years I was in college: %A" myCollegeYears

// ranges
let rangeList = [1 .. 10]
printfn "List of range 1..10: %A" rangeList

// ranges of characters
let alfaRangeList = ['a' .. 'z']
printfn "Alphabet from range list: %A" alfaRangeList

// List.init to build new list
let initList = List.init 5 (fun i -> (i, i * i, i * i * i))
printfn "Built with List.init: %A" initList

// yield operator
let yieldList = [ for i in 1 .. 5 do yield (i * 5) ]
printfn "List build with yield/list-comprehension: %A" yieldList

// yield example 2
let yieldList2 = [ 
  for a in 1 .. 10 do
    if a % 3 = 0 && a % 5 = 0 then
      yield a 
]
printfn "Another yield example: %A" yieldList2


// yield! operator
let yieldList3 = [for a in 1 .. 3 do yield! [ a .. a + 3 ] ]
printfn "One last yield example: %A" yieldList3

// ----

printfn "--- List properties ---"

let testMe = [ 2; 4; 6; 8; 10; 12; 14; 16 ]

printfn "list.IsEmpty -> %b" (testMe.IsEmpty)
printfn "list.Length -> %d" (testMe.Length)
printfn "list.Head -> %d" (testMe.Head)
printfn "list.Tail.Head -> %d" (testMe.Tail.Head)
printfn "list.Tail.Tail.Head -> %d" (testMe.Tail.Tail.Head)
printfn "list.Item(1) -> %d" (testMe.Item(1))



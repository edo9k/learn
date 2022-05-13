// map examples
let students = 
  Map.empty
    .Add("Fulano",    100)
    .Add("Beltrano",  101)
    .Add("Cicrano",   102)
    .Add("Ana",       201)
    .Add("Maria",     202)
    .Add("Braga",     203)

printfn "students saved on a map data structure: %A" students


// converting a list to a map
let capitals = 
  [ "Argentina",    "Buenos Aires";
    "France",       "Paris";
    "Chile",        "Santiago";
    "Malaysia",     "Kuala Lumpur";
    "Switzerland",  "Bern";
    "Brazil",       "Brasilia" ] 
  |> Map.ofList ;; 

printfn "a map of country/capitals from a list: %A" capitals


// access an individual element from a map
printfn "retrieving capital from a map"
printfn "capital of Brazil: %A" capitals.["Brazil"] 

// get number of items with count
printfn "number of items in the capitals map: %d" capitals.Count

// the TryFind method returns Some value if found
// and returns None if not found

printfn "Trying to find the capital of non-existing country: Atlantis" 

let nonExistingItem = capitals.TryFind "Atlantis"
match nonExistingItem with
| Some x -> printfn "Found: %s." x
| None -> printfn "Not found." 



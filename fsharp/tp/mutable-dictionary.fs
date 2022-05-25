
open System.Collections.Generic

let dict = new Dictionary<string, string>()

dict.Add("Segunda", "Monday")
dict.Add("Terça",   "Tuesday")
dict.Add("Quarta",  "Wednesday")
dict.Add("Quinta",  "Thursday")
dict.Add("Sexta",   "Friday")

printfn "dictionary days in PT-BR vs days in EN: %A" dict
printfn "weekdays dict has %d elements" dict.Count
printfn "keys in PT-BR: %A" dict.Keys
printfn "values in EN: %A" dict.Values

printfn "let's mutate a keys"

dict.["Segunda"] <- "Montag"

printfn "after mutation %A" dict



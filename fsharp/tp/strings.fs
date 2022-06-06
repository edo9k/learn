
// working XML (or anything with embedded quotes

let xmldata = @"<book author=""Charles Petzold"" title=""Code"">"
printfn "%s" xmldata


// collect applies a function to create new string

let collectExample text = 
  String.collect (fun c -> sprintf "%c " c) text

printfn "%s" (collectExample "spaces text")


// concat creates a new string by appending a list
let fruits = [ "Banana"; "Apple"; "Orange"; "Pineapple" ]
let text = String.concat ", " fruits
printfn "%s" text


// replicate (self explanatory)
printfn "%s" <| String.replicate 10 "*! "


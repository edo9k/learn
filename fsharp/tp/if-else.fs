
let metro   = 2035
let orwell  = 1984
let now     = 2022

printfn "-- Events --"
printfn "metro  -> %d " metro
printfn "orwell -> %d " orwell
printfn "now    -> %d " now 


(* if-then-else works as usual *)

if (metro < now) then
  printfn "Event metro is prior to now"
else
  printfn "Event metro is posterior to now"

if (orwell < now) then
  printfn "Event orwell is prior to now"
else
  printfn "Event orwell is posterior to now"


(* elif *)

if (now < now) then
  printfn "Event is prior to now"
elif (now > now) then
  printfn "Event is porterior to now"
else
  printfn "Event is exactly now" 



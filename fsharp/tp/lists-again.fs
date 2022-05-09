
printfn "--- more examples using lists ---"

// reversing a list with recursion

let list = [10..0] 
printfn "Original list: %A" list

let reverse lt = 
  let rec loop acc = function
    | [] -> acc
    | hd :: tl -> loop(hd :: acc) tl
  loop [] lt

printfn "Reversed list: %A" (reverse list)


// using list filter

let onlyEven = list |> List.filter (fun x -> x % 2 = 0);;

printfn "Only even numbers from original list: %A" onlyEven


// using list map

let squared = list |> List.map (fun x -> (x * x));;
printfn "All items squared: %A" squared


// appending lists (List.append and @)
let a = [1 ..  5]
let b = [6 .. 10]
let ab = List.append a b // with List.append
let ab' = a @ b // with the @ opperator

printfn "First list: %A" a
printfn "Second list: %A" b
printfn "Appended with List.append: %A" ab
printfn "Appended with @ operator: %A" ab' 


// List.sort and List.sum

printfn "Sorting with List.sort: %A" (List.sort list)
printfn "Sum with List.sum: %A" (List.sum list)
printfn "Average with List.average: %A" (List.average [0.0 .. 10.0])


// List.fold (which is reduce in Javascript)

let foldSum = List.fold( fun acc cur -> acc + cur) 0 list 
printfn "Sum with List.fold: %A" foldSum




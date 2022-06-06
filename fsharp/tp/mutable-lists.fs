
open System.Collections.Generic

let books = new List<string>()

books.Add("Lord of the Rings")
books.Add("The Hitchhiker's Guide")
books.Add("Hyperion")
books.Add("Dune")
books.Add("Narnia")
books.Add("The Three Body Problem")

printfn "Total %d books" books.Count

books |> Seq.iteri (fun i item -> printfn "%i: %s" i item)
books.Insert(2, "In Search of Lost Time") 

printfn "after inserting at index 2"
printfn "total %d books" books.Count

books |> Seq.iteri (fun i item -> printfn "%i: %s" i item)
books.RemoveAt(3)

printfn "after removing item at index 3"
printfn "total %d books" books.Count
books |> Seq.iteri (fun i item -> printfn "%i: %s" i item)


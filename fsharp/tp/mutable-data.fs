
// mutable data example

open System

type studentData =
  { ID : int
  ; mutable IsRegistered    : bool
  ; mutable RegisteredText  : string
  } 

let getStudent id = 
  { ID = id
  ; IsRegistered    = false
  ; RegisteredText  = null
  }

let registerStudents (students : studentData list) =
  students |> List.iter( fun st ->
    st.IsRegistered <- true
    st.RegisteredText <- sprintf "Registered %s" (
      DateTime.Now.ToString("hh:mm:ss"))

    Threading.Thread.Sleep(1000)) 


let printData (students : studentData list) = 
  students |> List.iter (fun x -> printfn "%A" x)


let students = List.init 3 getStudent

printfn "before process:"
printData students

printfn "after process:"
registerStudents students
printData students 

Console.ReadKey(true) |> ignore 

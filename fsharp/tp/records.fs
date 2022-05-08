
// record example

type student = 
  { Name: string
  ; ID:   int
  ; RegistrationText: string
  ; IsRegistered:     bool
  }

let getStudent name id = 
  { Name = name
  ; ID = id
  ; RegistrationText = null
  ; IsRegistered = false
  }

let registerStudent st = 
  { st with
      RegistrationText = "Registered";
      IsRegistered = true }

let printStudent msg st = 
  printfn "%s: %A" msg st

let main () = 
  let preRegistrationStudent = getStudent "Luffy" 10
  let postReistrationStudent = registerStudent preRegistrationStudent
  
  printStudent "Before registration: " preRegistrationStudent
  printStudent "After registration:  " postReistrationStudent

// ---
main()



(* printing stuff *) 

print_endline "Hello, World! (from ocaml)"
;;

Printf.printf "In the current year of our lord of %d\n" 2023
;;


(* reading input from user *) 
print_endline "Write some crap:"; 
let input_line = read_line () in
Printf.printf "The crap you wrote: %s\n" input_line;



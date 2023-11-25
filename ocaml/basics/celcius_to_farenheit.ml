
let celsius_to_fahrenheit celsius =
  celsius *. 9.0 /. 5.0 +. 32.0


let () =
  print_string "Enter temperature in Celsius: ";
  flush stdout; 

  try 
    let celsius = float_of_string (read_line ()) in
    let fahrenheit = celsius_to_fahrenheit celsius in
    Printf.printf "%.2f C -> %.2f F \n" celsius fahrenheit
  with
  | Failure _ ->
      Printf.printf "Invalid input. Please enter a valid temperature. \n"
  | Sys.Break ->
      Printf.printf "Operation cancelled. \n"



let rec quicksort = function
  | [] -> []
  | pivot :: rest -> 
      let lesser, greater = List.partition (fun x -> x < pivot) rest in
      quicksort lesser @ [pivot] @ quicksort greater

let () = 
  let unsorted_list = [3; 1; 4; 1; 5; 9; 2; 6; 5; 3; 5] in
  let sorted_list = quicksort unsorted_list in
  Printf.printf "Unsorted List: [%s]\n" (
    String.concat "; " (List.map string_of_int unsorted_list));
  Printf.printf "Sorted List:   [%s]\n" (
    String.concat "; " (List.map string_of_int sorted_list))


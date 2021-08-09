(* examples from the book Programming in Standar ML *)
(*                by Robert Harper                  *)


fun srev (s:string):string = implode (rev (explode s))

fun pal (s:string):string = s ^ (srev s)

fun double (n:int):int = n + n

fun square (n:int):int = n * n

fun halve (n:int):int = n div 2

fun is_even (n:int):bool = (n mod 2 = 0)


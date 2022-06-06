
// types

type Stack = StackContents of float list

// stack primitives

let push x (StackContents contents) =
  StackContents (x::contents)

let pop (StackContents contents) =
  match contents with
  | top::rest ->
    let newStack = StackContents rest
    (top, newStack)
  | [] ->
    failwith "Stack underflow"


// operators

let binary mathFn stack =
  let  y, stack'  = pop stack
  let  x, stack'' = pop stack'
  let  z          = mathFn x y 
  push z stack''

let unary f stack = 
  let x, stack' = pop stack
  push (f x) stack'


// other core functions

let SHOW stack = 
  let x, _ = pop stack
  printfn "The answer is %f" x
  stack // <- keep going with existing stack

let DUP stack =
  let x, s = pop stack
  push x (push x s)

let SWAP stack = 
  let  x, s  = pop stack
  let  y, s' = pop s 
  push y (push x s')

let DROP stack =
  let _, s = pop stack  // pop stack top
  s                     // return rest of the stack


// constants and words based on primitives

let EMPTY = StackContents []
let START = EMPTY


// numbers

let ONE   = push 1.0
let TWO   = push 2.0
let THREE = push 3.0
let FOUR  = push 4.0
let FIVE  = push 5.0


// math functions

let ADD = binary (+)
let SUB = binary (-)
let MUL = binary (*)
let DIV = binary (/)

let NEG = unary (fun x -> -x)

// words based on composition

let SQUARE = 
  DUP >> MUL

let CUBE =
  DUP >> DUP >> MUL >> MUL

let SUM_NUMBERS_UPTO =
  DUP
  >> ONE
  >> ADD
  >> MUL
  >> TWO
  >> DIV
  >> SHOW

START |> THREE |> SQUARE |> SUM_NUMBERS_UPTO |> SHOW

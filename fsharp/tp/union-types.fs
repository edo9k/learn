
// trivial yes/no type

type choice =
  | Yes
  | No

let confirmed = Yes
let cancelled = No

printfn "the positive value of choice type: %A" confirmed
printfn "the negative value of choice type: %A" cancelled


// shape type example

type Shape = 
  | Circle of float
  | Square of float
  | Rectangle of float * float

let pi = 3.1415

let area myShape = 
  match myShape with
  | Circle radius -> pi * radius * radius
  | Square s -> s * s 
  | Rectangle (h, w) -> h * w 

let radius = 12.0
let myCircle = Circle(radius)

printfn "Area of a cicle with radius %g: %g" radius (area myCircle)


let side = 5.0
let mySquare = Square(side)
printfn "Area of square with side %g: %g" side (area mySquare)


let height, width = 5.0, 8.0
let myRectangle = Rectangle(height, width)
printfn "Area of a rectangle with height %g and width %g: %g" 
  height width (area myRectangle) 



fn main() {

    // using let, the compiler will guess variable type
    // at compile time
    let company = "Interstar Picadasgalatica";
    let rating = 9.8;
    let is_imaginary = true;
    let poop = '💩';

    println!("company is {}", company);
    println!("rating is {}", rating);
    println!("is_imaginary is {}", is_imaginary);
    println!("poop is {}", poop);

    // integer types
    let anything = 666; // i32 by default
    let age:u32  = 2021; 
    let sum:i32  = 69-666;
    let mark:isize = 42;
    let count:usize = 69;

    println!("anything value is {}", anything);
    println!("sum is {} and age is {}", sum, age);
    println!("mark is {} and count is {}", mark, count);

    /* numbers will wrap around with overflow
     * but you need to tell the compiler to allow this
    let byte_cell0:u8 = 255;
    let byte_cell1:u8 = 256;
    let byte_cell2:u8 = 257;

    println!("u8 with value 255 will overflow to {}", byte_cell0);
    println!("u8 with value 256 will overflow to {}", byte_cell1);
    println!("u8 with value 257 will overflow to {}", byte_cell2);
    */

    // floats
    let some_float = 10.00; // f65 by default
    let wrong_pi:f32 = 3.14150;
    let dddouble:f64 = 1234.56789; // double

    println!("floating point numbers: {}, {}, {}", some_float, wrong_pi, dddouble);

    // numbers can have separators
    let bigass_number = 123_456_789;
    println!("bigass number: {}", bigass_number);

    // regular bool
    let am_i_sleepy:bool = true;
    println!("am_i_sleepy? {}", am_i_sleepy);

    // chars use simple quote
    let a = 'a'; // no need for typing
    let b:char = 'b'; // but if you insist, it's ok too
    let n:char = 'ん'; // uft8 extended seems to be ok too
    println!("characters: {}, {}, {}.", a, b, n);
}

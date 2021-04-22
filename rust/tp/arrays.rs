
fn main() {
    // rust has three syntaxes for array creation
    let array_literal = [1987, 2009, 2021]; // detects type
    
    let array_typed:[u16;3] = [1995, 1999, 2000];

    let array_default:[u8;3] = [42;3]; // initializes with default value

    println!("array example #1 -> {:?}", array_literal);
    println!("array example #2 -> {:?}", array_typed);
    println!("array example #3 -> {:?}", array_default);

    println!("\nlooping through an array");

    // with numbered params
    for i in 0..3 {
        println!("index {} -> value {}", i, array_literal[i]);
    }

    // getting values from array.iter()
    for v in array_literal.iter() {
        println!("value -> {}", v);
    }

    println!("\narray can be multable, but have fixed size");
    let mut array_multable:[u8;10] = [0;10]; // zeroed elements
    println!("before mutation -> {:?}", array_multable);
    array_multable[5] = 69;
    array_multable[9] = 56;
    println!("after mutation -> {:?}", array_multable);

    println!("\narrays as parameters to functions");
    println!("before calling function -> {:?}", array_multable);

    // this is being passed as reference (aka, a pointer)
    // it could also be passed by value, leaving the external array
    // unaltered.
    plus_one(&mut array_multable);
    println!("after calling function -> {:?}", array_multable);
    
}

fn plus_one(array:&mut [u8;10]) {
    for i in 0..10 {
        array[i] = array[i] + 1;
    }
    println!("inside function -> {:?}", array);
}


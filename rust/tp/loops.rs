
fn main() {
    println!("Rust has three kinds of loops: for, while, and loop.");
    
    println!("-- counting with `for counter in lower_limit..upper_limit`:");
    for i in 0..10 { // will stop on nine.
        print!("{}, ", i);
        // you can use `continue;` to skip back to the evaluation line
        // and also use  `break;` to break out of the loop
    }
    println!(" done.");

    println!("-- the while loop also works as expected:");
    let mut i = 0;
    while i < 10 {
        i += 1; // rust has no `++`,  `inc` operator
        print!("{}, ", i);
    }
    println!(" done.");

    println!("-- there's also the one called `loop`
    this one only ends when you explicitly call `break;`");

    let mut i = 0;
    loop {
        print!("{}, ", i);
        i += 1;
        if i == 10 { break };
        // if uses no parens, but the curly brackets are mandatory.
        // the compiler will scold you for not using them.
    }
    println!(" done.");
}


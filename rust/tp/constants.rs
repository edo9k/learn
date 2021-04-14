
fn main() {
    // let can be declared mutable with mul
    // constants do not. they're always immutable (duh)
    // and you must always specify the type
    const YEAR:u16 = 2021;

    println!("YEAR constant was set to {}", YEAR);

    // normal let variables can be redeclared and thus shadowed
    let number = "nine";
    println!("the number variable was assigne: {}", number);

    // they can even change type when reassigning/shadowing
    let number = 256;
    println!("number was reassigned to {}", number);

    // CONSTANTS cannot be shadowed.
}



fn main() {
    let example_tuple:(i32, f64, u8) = (-275, 3.14, 69);

    println!("You need a special operator to print all values in a tuple.");
    println!("{:?}\n", example_tuple);

    println!("You can also print tuple values individually.");
    println!("the 1st value is an i32 -> {:?}", example_tuple.0);
    println!("the 2nd value is an f64 -> {:?}", example_tuple.1);
    println!("the 3rd value is an u8  -> {:?}", example_tuple.2);

    // this is a shit example, but whatever.
    //         (  name, age, alive)
    let person:(&str, u8,  bool ) = ("Eduardo", 33, true);

    println!("\nNaturally, tuples can be arguments for functions.");
    print_person_tuple(person);

    println!("\nThere are also destructuring assignments in rust:");
    let (name, age, alive) = person; // pulls values out of the tuple

    println!(" name = {}\n age = {}\n alive? {}\n", name, age, alive);
}

fn print_person_tuple(p:(&str, u8, bool)) {
    println!("from print fn: (name, age, alive) -> {:?}", p);
}

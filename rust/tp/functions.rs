
// simplest function possible
fn hi() {
    println!("hi (print from within a no-params and no-return fn");
}

// a function with a return
fn get_year() -> u16 {
    return 2021;
}

// a function with parameters (passed by value)
fn double_num_by_value(mut n: u32) {
    n = n * 2;
    println!("inside function: {}", n);
}

// a function with parameters (passed by value)
fn double_num_by_reference(n:&mut u32) {
    *n = *n * 2;
    println!("inside function: {}", n);
}

fn string_param(s:String) {
    println!("The s:String param has value -> {}", s);
}

fn main() {
    println!("functions can be define before or after the main function");

    hi(); // calling the simple function

    println!("printing value return from an function -> {}", get_year());
    
    println!("parameters by value and by reference");

    let mut number:u32 = 256;

    println!("using `double_num_by_value");
    println!("number before fn call {}", number);
    double_num_by_value(number);
    println!("number after fn call {}\n", number);

    println!("using `double_num_by_reference");
    println!("number before fn call {}", number);
    double_num_by_reference(&mut number);
    println!("number after fn call {}\n", number);

    println!("fn that prints a parameter string: "); 
    string_param( String::from("meh"));

}


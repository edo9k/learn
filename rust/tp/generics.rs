
// generic struct example
struct Data<T> {
    value:T,
}

// trait example
struct Book {
    name:&'static str,
    id:u32
}

// declare a trait
trait Printable {
    fn print(&self);
}

// implement a trait
impl Printable for Book {
    fn print(&self) {
        println!("printing book #{} with title {}", self.id, self.name);
    }
}

// generict function example
use std::fmt::Display;

fn print_pro<T:Display>(t:T) {
    println!("printing from inside the generic function");
    println!("{}", t);
}

fn main() {
    println!("
    Vectors are a good example of generic data type
    You must define, when creating the vector, which type
    it is going to hold (like Vec<i32>, Vec(u8))
    ");

    let mut years: Vec<u16> = vec![1987, 2009, 2014];
    years.push(2021);
    println!("{:?}", years);

    println!("
    Generic structres do the same as Vec, but are programmer
    defined data structtures.
    ");

    let a:Data<i32> = Data{value:256};
    println!("generic struct with type i32: {}", a.value);

    let b:Data<String> = Data{value:"pizza".to_string()};
    println!("generic struct with type String: {}", b.value);

    println!("
    Rust has 'traits', which implement behaviors/methods 
    for multiple structures. They are like 'interfaces' in the
    Object-Oriented language.
    ");

    let book = Book {
        id: 2048,
        name: "Structure and Implementation of Computer Programs"
    };

    book.print();

    println!("
    There are also generic functions
    ");

    print_pro(123 as u8 );
    print_pro(321 as u16);
    print_pro("and that's all.");

}


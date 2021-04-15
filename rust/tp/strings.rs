
fn main() {

    // strings in rust can be pointer to literals
    let country:&str = "Brazil"; // static by default
    println!("Country stored in string literal: {}", country);

    // but you can make that explicit too
    let city:&'static str = "Linhares";
    println!("City stored in string literal: {}", city);

    // but they can also be objects, with a bunch of cool utils
    let other_country = String::from("Argentina");
    println!(
        "Country in the object string ({}) has {} letters.", 
        other_country,
        other_country.len());

    println!("
    There's a bunch more cool functions that come with
    the String object in rust. Like: replace, as_str, push,
    push_str, len, trim, split_whitespace, split, chars...
    I'm too sleepy to write examples for all of them right now.");
}


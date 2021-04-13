
fn main() {
    
    println!("Rust variables are immutable by default.");
    println!("So if you intent on reassigning, you need to mark");
    println!("the variable as multable with `mut`.");

    let mut example = 256;
    println!("variable example has the value ({})", example);
    example = 512;
    println!("after reassignment the value is ({})", example);

    // trying to mutate an variable without flagging it will
    // raise an error at compile time.
    //
    // this chapter also dealt with variable naming
    // which is the just the sane "case sensitive" and
    // anything on the ranges a-zA-Z0-9 plus _ (underscore)
}


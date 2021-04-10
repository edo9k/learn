
/*
 *  Rust does not have the dump octal notation.
 *  Where you can accidentally create an octal by 
 *  adding an extra zero before the number. 
 *
 *  Languages that have this: C, C++, Java, Javascript, PHP, Bash, Python 1&2
 *  Languages that don't: Haskell, C#, Python 3+, Javascript on 'use strict'
 *
 */

fn main() {
    println!("{}", 077 + 3); // correctly prints 80
}


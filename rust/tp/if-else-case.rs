
fn main() {

    println!("-- if and if else work as expected. but have not parens.");

    let year = 2021;

    println!("example variable -> year ({})", year);

    if year == 2021 {
        println!("the year is 2021 (i'm not very creative for examples right now.");
    }

    if year % 2 == 0 {
        println!("it's an even year.");
    } else {
        println!("it's an odd year. (in more than one sence, for sure)");
    }

    println!("-- you can nest if-elses forever as expected.");
    println!("-- there are match expressions too, like switch-cases");

    let state_code = "ES";

    let state = match state_code {
        "ES" => { println!("Found match for ES"); "Espírito Santo" },
        "SP" => "São Paulo",
        "RJ" => "Rio de Janeiro",
        "MG" => "Minas Gerais",
        _ => "State code unknown"
    };

    println!("The state for state code {} is {}.", state_code, state);
}


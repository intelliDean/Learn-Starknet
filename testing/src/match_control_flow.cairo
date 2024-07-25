
#[derive(Drop, Debug)] // Debug so we can inspect the state in a minute
enum UsState {
    Alabama,
    Alaska,
}

#[derive(Drop)]
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter: UsState,
}

//this works like switch in Java
fn value_in_cents(coin: Coin) -> felt252 {
    match coin {
        Coin::Penny => {
            println!("Penny is 1");
            return 1;
        },
        Coin::Nickel => {
            println!("Nickel is 5");
            return 5;
        },
        Coin::Dime => {
            println!("Dime is 10");
            return 10;
        },
        Coin::Quarter(state) => {
            //Because state is an UsState enum which implements the Debug trait,
            //we can print state value with println! macro.
            println!("State quarter from {:?}!", state);
            return 25;
        },

        //Note: {:?} is a special formatting syntax that allows to print
        //a debug form of the parameter passed to the println! macro.
    }
}


fn plus_one(x: Option<u8>) -> Option<u8> {
    match x {
        Option::Some(val) => Option::Some(val + 1),
        Option::None => Option::None,
    }
}

fn main() {
    let five: Option<u8> = Option::Some(5);
    let six: Option<u8> = plus_one(five);
    let none = plus_one(Option::None);
}

//Matches in Cairo are exhaustive: we must exhaust every last possibility
//in order for the code to be valid. 

//Catch-all with the _ Placeholder
fn vending_machine_accept(coin: Coin) -> bool {
    match coin {
        Coin::Dime => true,
        _ => false,
    }
}

//Multiple Patterns with the | Operator
fn vending_machine_accept(coin: Coin) -> bool {
    match coin {
        Coin::Dime | Coin::Quarter => true,
        _ => false,
    }
}

//Matching Tuples
#[derive(Drop)]
enum DayType {
    Week,
    Weekend,
    Holiday
}

fn vending_machine_accept(c: (DayType, Coin)) -> bool {
    match c {
        (DayType::Week, _) => true,
        (_, Coin::Dime) | (_, Coin::Quarter) => true,
        (_, _) => false,
    }
}


//Matching felt252 and Integer Variables
fn roll(value: u8) {
    match value {
        0 | 1 | 2 => println!("you won!"),
        3 => println!("you can roll again!"),
        _ => println!("you lost...")
    }
}
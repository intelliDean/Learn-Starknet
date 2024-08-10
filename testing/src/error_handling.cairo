
//UNRECOVERABLE 
//PANIC
fn main() {
    let mut data = array![2];

    if true {
        panic(data);
    }
    println!("This line isn't reached");
}

//PANIC WITH FELT252
use core::panic_with_felt252;

fn main() {
    panic_with_felt252(2);
}


//PANIC MACRO
//panic! allows the input, which is ultimately the panic error, 
// to be a literal longer than 31 bytes.
fn main() {
    if true {
        panic!("2");
    }
    println!("This line isn't reached");
}

//NOPANIC NOTATION
//This function will always return 42 and is guaranteed to never panic
fn function_never_panic() -> felt252 nopanic {
    42
}

//The following function is not guaranteed to never panic:
fn function_never_panic() nopanic {
    assert(1 == 1, 'what');
}




//RECOVERABLE

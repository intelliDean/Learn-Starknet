

//constamt are always immutable and cannot be used with mut keyword
const BIRTH_YEAR: u32 = 1994;
const ONE_HOUR_IN_SECONDS: u32 = consteval_int!(60 * 60);

fn main() {
    println!("Hello, World!");

    variable();

    shadowing();

    shadowingPro();

    scalar_types();

    tup();

    println!("result is {}", testing_function(10));

    loop_with_continue();

    loop_with_return();

    while_loop();

    fibonacci(12);

    factorial_of_a_number(30);

    array_macro();

    let p1 = Point { x: 5, y: 10 };
    foo(p1);
    foo(p1);


    let arr1: Array<u128> = array![1,2,3,4];

    let (arr2, len) = calculate_length(arr1);

    println!("array the length is {}",  len);

    act_as_main();
}



fn act_as_main() {
    let mut arr1: Array<u128> = array![];

    let first_snapshot = @arr1; // Take a snapshot of `arr1` at this point in time
    arr1.append(1); // Mutate `arr1` by appending a value

    let first_length = calc_length(first_snapshot); // Calculate the length of the array when the snapshot was taken

    let second_length = calc_length(@arr1); // Calculate the current length of the array

    println!("The length of the array when the snapshot was taken is {}", first_length);
    println!("The current length of the array after snapshop is {}", second_length);
}

fn calc_length(arr: @Array<u128>) -> usize {
    arr.len()
}

fn calculate_length(arr: Array<u128>) -> (Array<u128>, usize) {
    let length = arr.len(); // len() returns the length of an array

    (arr, length)
}

#[derive(Copy, Drop)]
struct Point {
    x: u128,
    y: u128,
}

fn foo(mut p: Point) { // do something with p
    p.x += 40;
    println!("Px => {}", p.x);
}


//variables in cairo are immutable by default
fn variable() {
    let mut x = 5;
    println!("Here, the value of x is: {}", x);

    x = 6;
    println!("Here, the value of x is: {}", x);

    println!("I was born in {}", BIRTH_YEAR);
}

fn variablesAreImmutable() {
    //by default, variables are immutable unless used with mut keyword to signifies it's mutable
    let mut name = 'Dean';

    name = 'Michael';

    name = 'James';
}

fn shadowing() {
    let x = 5;
    let x = x + 1;
    {
        let x = x * 2;
        println!("Inner scope x value is: {}", x);
    }
    println!("Outer scope x value is: {}", x);
}

fn shadowingPro() {
    let x: u64 = 2;
    println!("The value of x is {} of type u64", x);

    // converts x to a felt, type annotation is required.
    let x: felt252 = x.into();
    println!("The value of x is {} of type felt252", x);
}

//=======================DATA TYPES==============================================
//scalar and compound

fn unwrapping() {
    let x: felt252 = 3;

    let y: u32 = x.try_into().unwrap();
}

//scalar types: felts, integers, booleans
fn scalar_types() {
    // addition
    let sum = 5_u128 + 10_u128;
    println!("5 + 10 = {}", sum);

    // subtraction
    let difference = 95_u128 - 4_u128;
    println!("95 - 4 = {}", difference);

    // multiplication
    let product = 4_u128 * 30_u128;
    println!("4 x 30 = {}", product);

    // division
    let quotient1 = 56_u128 / 32_u128; //result is 1
    let quotient2 = 64_u128 / 32_u128; //result is 2
    println!("56 / 32 = {}", quotient1);
    println!("64 / 32 = {}", quotient2);

    // remainder
    let remainder = 43_u128 % 5_u128; // result is 3
    println!("43 mod 5 = {}", remainder);
}

fn boolean() {
    let t = true;

    let f: bool = false;
}

// ==========================STRING=================================================
//short strings uses simple quotes
//ByteArray uses double quotes.

fn char() {
    let my_first_char = 'C';
    let my_first_char_in_hex = 0x43;

    let my_first_string = 'Hello world';
    let my_first_string_in_hex = 0x48656C6C6F20776F726C64;
}

fn bytesArray() {
    let long_string: ByteArray = "this is a string which has more than 31 characters";
}


// ==========================COMPOUND TYPES=====================================
//TUPLE
fn tup() {
    let tup: (u32, u64, bool) = (10, 20, true);

    // let tup = (500, 6, true);

    //destructuring
    let (x, y, z) = (500, 6, true);

    if y == 6 {
        println!("y is 6!");
    }
}

// ==========================TYPE CONVERSION=====================================

fn conertInto() {
    let my_u8: u8 = 10;
    let my_u16: u16 = my_u8.into();
    let my_u32: u32 = my_u16.into();
    let my_u64: u64 = my_u32.into();
    let my_u128: u128 = my_u64.into();

    let my_felt252 = 10;
    // As a felt252 is smaller than a u256, we can use the into() method
    let my_u256: u256 = my_felt252.into();
    let my_other_felt252: felt252 = my_u8.into();
    let my_third_felt252: felt252 = my_u16.into();
}

fn tryConvertInto() {
    let my_u256: u256 = 10;

    // Since a u256 might not fit in a felt252, we need to unwrap the Option<T> type
    let my_felt252: felt252 = my_u256.try_into().unwrap();
    let my_u128: u128 = my_felt252.try_into().unwrap();
    let my_u64: u64 = my_u128.try_into().unwrap();
    let my_u32: u32 = my_u64.try_into().unwrap();
    let my_u16: u16 = my_u32.try_into().unwrap();
    let my_u8: u8 = my_u16.try_into().unwrap();

    let my_large_u16: u16 = 2048;
    let my_large_u8: u8 = my_large_u16.try_into().unwrap(); // panics with 'Option::unwrap failed.'
}

fn testing_function(number: u32) -> u32 {
    number + 1
// return number + 1;

}

fn loop_with_continue() {
    let mut i: usize = 0;
    loop {
        if i == 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("i = {}", i + 1);
        i += 1;
    }
}

fn loop_with_return() {
    let mut counter = 0;

    let result = loop {
        if counter == 10 {
            break counter * 2;
        }
        counter += 1;
    };

    println!("The result is {}", result);
}

fn while_loop() {
    let mut number = 3;

    while number != 0 {
        println!("{number}!");
        number -= 1;
    };

    println!("LIFTOFF!!!");
}

fn fibonacci(num: u8) {
    let mut a = 0;
    let mut b = 1;

    let mut i = 0;
    println!("{}", a);
    println!("{}", b);

    loop {
        if i == num {
            break;
        }

        let mut temp = b;
        let mut c = a + b;
        a = temp;
        b = c;

        println!("{}", c);

        i += 1;
    }
}

fn factorial_of_a_number(num: u256) {
    let mut i: u256 = num;
    let mut result: u256 = 1;

    loop {
        if i == 1 {
            break;
        }

        result *= i;

        i -= 1;
    };

    println!("{}", result);
}


fn array_macro() {
    let arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    let mut i = 0;

    while i < arr.len() {
        println!("index {} => {}", i, *arr[i]);

        i += 1;
    }
}

//Cairo is a language built around a linear type system that allows us 
//to statically ensure that in every Cairo program, a value is used exactly once.

//Cairo is a language built around a linear type system that allows us 
//to statically ensure that in every Cairo program, a value is used exactly once.

//the owner of a variable is the code that can read (and write if mutable) the variable.

//In Cairo:
//  Each variable in Cairo has an owner.
//  There can only be one owner at a time.
//  When the owner goes out of scope, the variable is destroyed.



//In this example, we can pass p1 twice to the foo function because the Point type 
//implements the Copy trait. This means that when we pass p1 to foo, 
//we are actually passing a copy of p1, so p1 remains valid.
#[derive(Copy, Drop)]
struct Point {
    x: u128,
    y: u128,
}

fn use_foo() {
    let p1 = Point { x: 5, y: 10 };
    foo(p1);
    foo(p1);
}

fn foo(mut p: Point) { // do something with p
    p.x += 40;
    println!("Px => {}", p.x);
}


fn calculate_length(arr: Array<u128>) -> (Array<u128>, usize) {
    let length = arr.len(); // len() returns the length of an array

    (arr, length)
}
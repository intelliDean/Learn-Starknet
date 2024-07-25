#[derive(Drop, Copy)]
struct Human {
    name: ByteArray,
    age: u8,
    username: ByteArray,
    email: ByteArray,
    isRegistered: bool
}

fn main() {
    let mut _human = Human {
        name: ByteArray::from("John"),
        username: "Johnie",
        isRegistered: true,
        email: "jonie@gmail.com",
        age: 12
    };

    _human.age = 23;

    // this is how to use struct update syntax where you use the information of a struct to initialize a new struct
    // without having to write each new fields one after the other from the other struct into this new struct
    //in this case, we are using the information of the former struct _human to initialize the new struct new_human
    //in the new_human, the only different field is the email field while every other fields remain the same as _human
    //so email is changed while every other field remains the same as _human and that is done with => .._human
    let new_human = Human { emai: "new_john@gmail.com", .._human };
}

//this is so because the parameters and the struct field have same name, so there's no need for repitition
fn create_human(name: ByteArray, username: ByteArray, email: ByteArray, age: u8) -> Human {
    Human { name, username, isRegistered: true, email, age }
}


//===============================================================================================================
//DOING THE SAME THING IN  DIFFERENT WAYS
//1. WITH VARIABLES
fn areaVar(width: u64, height: u64) -> u64 {
    width * height
}

//1. WITH TUPLE
fn areaTup(dimension: (u64, u64)) -> u64 {
    let (x, y) = dimension;
    x * y
}

//1. WITH STRUCT
#[derive(Drop, Copy)]
struct Rectangle {
    width: u64,
    height: u64,
}

fn areaStr(rectangle: Rectangle) -> u64 {
    rectangle.width * rectangle.height
}
//===============================================================================================================

//TYPE CONVERSION USING => INTO
// Compiler automatically imports the core library, so you can omit this import
use core::traits::Into;

#[derive(Drop, PartialEq)]
struct Rectangle {
    width: u64,
    height: u64,
}

#[derive(Drop)]
struct Square {
    side_length: u64,
}

impl SquareIntoRectangle of Into<Square, Rectangle> {
    fn into(self: Square) -> Rectangle {
        Rectangle { width: self.side_length, height: self.side_length }
    }
}

fn main() {
    let square = Square { side_length: 5 };
    // Compiler will complain if you remove the type annotation
    let result: Rectangle = square.into();
    let expected = Rectangle { width: 5, height: 5 };
    assert!(
        result == expected,
        "A square is always convertible to a rectangle with the same width and height!"
    );
}

//===================================================================================================================
//TYPE CONVERSION USING => TRYINTO
// Compiler automatically imports the core library, so you can omit this import
use core::traits::TryInto;

#[derive(Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

#[derive(Drop, PartialEq)]
struct Square {
    side_length: u64,
}

impl RectangleIntoSquare of TryInto<Rectangle, Square> {
    fn try_into(self: Rectangle) -> Option<Square> {
        if self.height == self.width {
            Option::Some(Square { side_length: self.height })
        } else {
            Option::None
        }
    }
}

fn main() {
    let rectangle = Rectangle { width: 8, height: 8 };
    let result: Square = rectangle.try_into().unwrap();
    let expected = Square { side_length: 8 };
    assert!(
        result == expected,
        "Rectangle with equal width and height should be convertible to a square."
    );

    let rectangle = Rectangle { width: 5, height: 8 };
    let result: Option<Square> = rectangle.try_into();
    assert!(
        result.is_none(),
        "Rectangle with different width and height should not be convertible to a square."
    );
}
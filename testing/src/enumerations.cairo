
//================SIMPLE ENUM=============================

#[derive(Drop)]
enum Human {
    Man,
    Woman,
}

//================ENUMS WITH ASSOCIATE VALUES==================

#[derive(Drop)]
enum Direction {
    North: u128,
    East: u128,
    South: u128,
    West: u128,
}

//================TRAIT IMPLEMENTATION FOR ENUMS=============================

#[derive(Drop)]
enum Message {
    Quit,
    Echo: felt252,
    Move: (u128, u128),
}

trait Processing {
    fn process(self: Message);
}

impl ProcessingImpl of Processing {
    fn process(self: Message) {
        match self {
            Message::Quit => { println!("quitting") },
            Message::Echo(value) => { println!("echoing {}", value) },
            Message::Move((x, y)) => { println!("moving from {} to {}", x, y) },
        }
    }
}

//================OPTION ENUMS=============================
//The Option enum is a standard Cairo enum that represents the concept of an
//optional value. It has two variants: Some: T and None. Some: T indicates that
//there's a value of type T, while None represents the absence of a value.

enum Option<T> {
    Some: T,
    None,
}

//recurssion
fn find_value_recursive(mut arr: Span<felt252>, value: felt252, index: usize) -> Option<usize> {
    match arr.pop_front() {
        Option::Some(index_value) => { if (*index_value == value) {
            return Option::Some(index);
        } },
        Option::None => { return Option::None; },
    };

    find_value_recursive(arr, value, index + 1)
}

//iteration
fn find_value_iterative(mut arr: Span<felt252>, value: felt252) -> Option<usize> {
    let mut result = Option::None;
    let mut index = 0;

    while let Option::Some(array_value) = arr.pop_front() {
        if (*array_value == value) {
            result = Option::Some(index);
            break;
        };

        index += 1;
    };

    result
}

//======================MAIN FUNCTION==========================================

fn main() {
    let man = Human::Man;

    let direction = Direction::North(10);

    let msg: Message = Message::Quit;
    msg.process();
}
// Assuming "front_of_house" module is contained in a crate called "restaurant", as mentioned in the
// section "Defining Modules to Control Scope"
// If the path is created in the same crate, "restaurant" is optional in the use statement

mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

use restaurant::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist(); // ✅ Shorter path
}

//================================================================

mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

use restaurant::front_of_house::hosting::add_to_waitlist;

pub fn eat_at_restaurant() {
    add_to_waitlist();
}

//================================================================

use core::num::traits::BitSize;

fn main() {
    let u8_size: usize = BitSize::<u8>::bits();
    println!("A u8 variable has {} bits", u8_size)
}

//================================================================

//using alias
use core::array::ArrayTrait as Arr;

fn main() {
    let mut arr = Arr::new(); // ArrayTrait was renamed to Arr
    arr.append(1);
}

//================================================================
//Importing Multiple Items from the Same Module

// Assuming we have a module called `shapes` with the structures `Square`, `Circle`, and `Triangle`.
mod shapes {
    #[derive(Drop)]
    pub struct Square {
        pub side: u32
    }

    #[derive(Drop)]
    pub struct Circle {
        pub radius: u32
    }

    #[derive(Drop)]
    pub struct Triangle {
        pub base: u32,
        pub height: u32,
    }
}

// We can import the structures `Square`, `Circle`, and `Triangle` from the `shapes` module like
// this:
use shapes::{Square, Circle, Triangle};

// Now we can directly use `Square`, `Circle`, and `Triangle` in our code.
fn main() {
    let sq = Square { side: 5 };
    let cr = Circle { radius: 3 };
    let tr = Triangle { base: 5, height: 2 };
    // ...
}

//================================================================
//Re-exporting Names in Module Files

mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub use restaurant::front_of_house::hosting;

fn eat_at_restaurant() {
    hosting::add_to_waitlist();
}

//================================================================
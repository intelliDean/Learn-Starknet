
//In Cairo, all items (functions, methods, structs, enums, modules, and constants)
//are private to parent modules by default.


//If you want to make an item like a function or struct private,
//you put it in a module.

//Items in a parent module can’t use the private items inside child modules,
//but items in child modules can use the items in their ancestor modules.
//This is because child modules wrap and hide their implementation details,
//but the child modules can see the context in which they’re defined.

mod front_of_house {
   pub mod hosting {
       pub fn add_to_waitlist() {}

       pub fn seat_at_table() {}
    }

   pub mod serving {
        pub fn take_order() {}

        pub fn serve_order() {}

        pub fn take_payment() {}
    }
}


pub fn eat_at_restaurant() {
    // Absolute path is the full path starting from a crate root.
    //The absolute path begins with the crate name.
    restaurant::front_of_house::hosting::add_to_waitlist();

    // Relative path starts from the current module.
    front_of_house::hosting::add_to_waitlist();
}


//Using super allows us to reference an item that we know is in the parent module,
//which can make rearranging the module tree easier when the module is closely
//related to the parent, but the parent might be moved elsewhere in the module tree someday.

fn deliver_order() {}

mod back_of_house {
    fn fix_incorrect_order() {
        cook_order();
        super::deliver_order();
    }

    fn cook_order() {}
}

//MAKING STRUCT AND ENUM PUBLIC
//STRUCT: If we use pub before a struct definition, we make the struct public,
//but the struct’s fields will still be private. We can make each field public or
//not on a case-by-case basis.

//ENUM: In contrast, if we make an enum public, all of its variants are then
//public. We only need the pub before the enum keyword.


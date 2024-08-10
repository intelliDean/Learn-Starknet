//modules
mod front_of_house;
mod human;

//bringing them into scope
use modulate::front_of_house::hosting;
use modulate::human::all_human;
use modulate::human::animals;


//usage
fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    all_human::register_human();
}

fn all_about_humans() {
    all_human::remove_human();    
}


//main function
fn main() {
    eat_at_restaurant();
    all_human::update_human();
    all_about_humans();

    animals::train_animal();
}
mod front_of_house;
mod human;

use modulate::front_of_house::hosting;
use modulate::human::all_human;
use modulate::human::animals;

fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    all_human::register_human();
}

fn all_about_humans() {
    all_human::remove_human();    
}

fn main() {
    eat_at_restaurant();
    all_human::update_human();
    all_about_humans();

    animals::train_animal();
}
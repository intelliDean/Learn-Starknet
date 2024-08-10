
// Generics, an abstract stand-ins for concrete types or other properties, 
// is the tool that cairo use to effectively handle the duplication of concepts.

// We can express the behavior of generics or how they relate to other generics
// without knowing what will be in their place when compiling and running the code.

//Generics allow us to replace specific types with a placeholder that
//represents multiple types to remove code duplication. 

// Functions can take parameters of some generic type, instead of a concrete type
// like u32 or bool, in the same way a function takes parameters with unknown values
// to run the same code on multiple concrete values


//Removing Duplication by Extracting a Function
fn largest(ref number_list: Array<u8>) -> u8 {
    let mut largest = number_list.pop_front().unwrap();

    while let Option::Some(number) = number_list.pop_front() {
        if number > largest {
            largest = number;
        }
    };

    largest
}

fn main() {
    let mut number_list = array![34, 50, 25, 100, 65];

    let result = largest(ref number_list);
    println!("The largest number is {}", result);

    let mut number_list = array![102, 34, 255, 89, 54, 2, 43, 8];

    let result = largest(ref number_list);
    println!("The largest number is {}", result);
}
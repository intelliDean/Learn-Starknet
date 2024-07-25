//in cairo array, once a memory slot is written to, it cannot be overwritten, 
//but only read from it. You can only append items to the end of an array and 
//remove items from the front.

fn create_array() {
    let mut arr = ArrayTrait::new();
    arr.append(0);
    arr.append(1);
    arr.append(2);
}

fn array_with_type() {
    let mut arr = ArrayTrait::<u128>::new();

    let mut _arr: Array<u128> = ArrayTrait::new();
}

//You can only remove elements from the front of an array by using the pop_front() method.
fn remove_from_array() {
    let mut a = ArrayTrait::new();
    a.append(10);
    a.append(1);
    a.append(2);

    let first_value = a.pop_front().unwrap();
    println!("The first value is {}", first_value);
}

//In Cairo, memory is immutable, which means that it is not possible to modify 
//the elements of an array once they've been added. You can only add elements 
//to the end of an array and remove elements from the front of an array. 

fn get_method_array() {
    let mut arr = ArrayTrait::<u128>::new();
    arr.append(100);

    let index = 1; // index of the array to get element from

    match arr.get(index) {
        Option::Some(x) => {
            // The * means "transform what get(idx) returned into a real value"
            *x.unbox()
        },
        Option::None => { panic!("out of bounds") }
    }
}


//You should only use at when you want the program to panic if the provided 
//index is out of the array's bounds, which can prevent unexpected behavior.
fn at_method_array() {
    let mut a = ArrayTrait::new();
    a.append(0);
    a.append(1);

    // using `at()` method
    assert(*a.at(0) == 0, 'item mismatch on index 0');
    // using subscripting operator
    assert(*a[1] == 1, 'item mismatch on index 1');
}

fn size_and_empty() {
    let mut arr = ArrayTrait::new();
    arr.append(1);
    arr.append(2);
    arr.append(3);
    arr.append(4);
    arr.append(5);

    assert(arr.len() == 5, 'it is not 5');

    assert(!arr.is_empty(), 'array is empty');
}


fn array_macro() {
    let arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    let mut i = 0;

    while i < arr.len() {
        println!("index {} => {}", i, *arr[i]);

        i += 1;
    }
}

fn with_and_without_macro() {
    let mut without_macro = ArrayTrait::new();
    let mut with_macro = array![];
    let mut or_this = array![1, 2, 3, 4, 5, 6, 7];

    without_macro.append(1);
    without_macro.append(2);
    without_macro.append(3);

    with_macro.append(1);
    with_macro.append(2);
    with_macro.append(3);
}


#[derive(Copy, Drop)]
enum Data {
    Integer: u128,
    Felt: felt252,
    Tuple: (u32, u32)
}

fn initialize_enum() {
    let mut messages: Array<Data> = array![];

    messages.append(
        Data::Integer(100)
    );
    messages.append(
        Data::Felt('hello world')
    );
    messages.append(
        Data::Tuple((10, 30))
    );
}

//Span is a struct that represents a snapshot of an Array.
fn array_with_span() {

    let mut arr = array![1, 2, 3, 4, 5, 6, 7];

    arr.span();
}

struct Name {
    
}
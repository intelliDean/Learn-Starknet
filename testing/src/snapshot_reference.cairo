//In Cairo, a snapshot is an immutable view of a value at a certain point in time.
//Recall that memory is immutable, so modifying a value actually creates a new memory cell. 
//The old memory cell still exists, and snapshots are variables that refer to that "old" value. 
//In this sense, snapshots are a view "into the past".

fn act_as_main() {
    let mut arr1: Array<u128> = array![];

    let first_snapshot =
        @arr1; // Take a snapshot of `arr1` at this point in time => this act like temp
    arr1.append(1); // Mutate `arr1` by appending a value

    let first_length = calculate_length(
        first_snapshot
    ); // Calculate the length of the array when the snapshot was taken

    let second_length = calculate_length(@arr1); // Calculate the current length of the array

    println!("The length of the array when the snapshot was taken is {}", first_length);
    println!("The current length of the array is {}", second_length);
}

fn calculate_length(arr: @Array<u128>) -> usize {
    arr.len()
}


fn shot(a: Array<u8>) -> @Array {
    @a
}


fn calculate_length(
    array_snapshot: @Array<u128> // array_snapshot is a snapshot of an Array
) -> usize {
    array_snapshot.len()
} // Here, array_snapshot goes out of scope and is dropped.
// However, because it is only a view of what the original array `arr` contains, the original `arr` can still be used.

//When functions have snapshots as parameters instead of the actual values, 
//we won’t need to return the values in order to give back ownership of the
//original value, because we never had it.

//===============================================================================================
//Desnap Operator
//To convert a snapshot back into a regular variable, 
//you can use the desnap operator *, which serves as the opposite of the @ operator.
//Only Copy types can be desnapped.
//However, in the general case, because the value is not modified, the new variable 
//created by the desnap operator reuses the old value, and so desnapping is a 
//completely free operation, just like Copy.

#[derive(Drop)]
struct Rectangle {
    height: u64,
    width: u64,
}

fn calculate_area(rec: @Rectangle) -> u64 {
    // As rec is a snapshot to a Rectangle, its fields are also snapshots of the fields types.
    // We need to transform the snapshots back into values using the desnap operator `*`.
    // This is only possible if the type is copyable, which is the case for u64.
    // Here, `*` is used for both multiplying the height and width and for desnapping the snapshots.
    (*rec.height) * (*rec.width)    //desnap height and width then multiply them both
}

fn main() {
    let rec = Rectangle { height: 3, width: 10 };
    let area = calculate_area(@rec);
    println!("Area: {}", area);
}

//MUTABLE REFERENCE
//Note: In Cairo, a parameter can only be passed as mutable reference using 
//the ref modifier if the variable is declared as mutable with mut.

#[derive(Drop)]
struct Rectangle {
    height: u64,
    width: u64,
}

fn flip(ref rec: Rectangle) {
    let temp = rec.height;
    rec.height = rec.width;
    rec.width = temp;
}

fn main() {
    let mut rec = Rectangle { height: 3, width: 10 };
    
    flip(ref rec);
    println!("height: {}, width: {}", rec.height, rec.width);
}


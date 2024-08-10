
//  In Cairo, we can use generics when defining functions, structs, enums, traits,
// implementations and methods

// GENERIC FUNCTIONS

// Specify generic type T between the angulars
fn largest_list<T, impl TDrop: Drop<T>>(l1: Array<T>, l2: Array<T>) -> Array<T> {
    if l1.len() > l2.len() {
        l1
    } else {
        l2
    }
}


fn main() {
    let mut l1 = array![1, 2];
    let mut l2 = array![3, 4, 5];

    // There is no need to specify the concrete type of T because
    // it is inferred by the compiler
    let l3 = largest_list(l1, l2);
}


//CONSTRAINTS FOR GENERIC TYPES
// for an element of type T to be comparable, it must implement the PartialOrd trait

// Given a list of T get the smallest one
// The PartialOrd trait implements comparison operations for T

// fn smallest_element<T, impl TPartialOrd: PartialOrd<T>, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(

fn smallest_element<T, +PartialOrd<T>, +Copy<T>, +Drop<T>>(list: @Array<T>) -> T {  //instead of the above, we use the '+' sign for "anonymous generic implementation parameter"
    // This represents the smallest element through the iteration
    // Notice that we use the desnap (*) operator
    let mut smallest = *list[0];

    // The index we will use to move through the list
    let mut index = 1;

    // Iterate through the whole list storing the smallest
    while index < list.len() {
        if *list[index] < smallest {
            smallest = *list[index];
        }
        index = index + 1;
    };

    smallest
}

//STRUCT

#[derive(Drop)]
struct Wallet<T, U> {
    balance: T,
    address: U,
}

// ENUM
enum Result<T, E> {
    Ok: T,
    Err: E,
}

//GENERIC METHODS

#[derive(Copy, Drop)]
struct Wallet<T> {
    balance: T
}

trait WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T;
}

impl WalletImpl<T, +Copy<T>> of WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T {
        return *self.balance;
    }
}

/// Trait for wallets of type u128
trait WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128);
}

impl WalletReceiveImpl of WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128) {
        self.balance += value;
    }
}

trait WalletMixTrait<T1, U1> {
    fn mixup<T2, +Drop<T2>, U2, +Drop<U2>>(
        self: Wallet<T1, U1>, other: Wallet<T2, U2>
    ) -> Wallet<T1, U2>;
}

impl WalletMixImpl<T1, +Drop<T1>, U1, +Drop<U1>> of WalletMixTrait<T1, U1> {
    fn mixup<T2, +Drop<T2>, U2, +Drop<U2>>(
        self: Wallet<T1, U1>, other: Wallet<T2, U2>
    ) -> Wallet<T1, U2> {
        Wallet { balance: self.balance, address: other.address }
    }
}


fn main() {
    let list: Array<u8> = array![5, 3, 10];

    // We need to specify that we are passing a snapshot of `list` as an argument
    let s = smallest_element(@list);
    assert!(s == 3);

    //STRUCT
    let w = Wallet { balance: 3, address: 14 };

    //GENERIC METHODS
    let mut w = Wallet { balance: 50 };
    assert!(w.balance() == 50);

    w.receive(100);
    assert!(w.balance() == 150);

    //We first create two instances: one of Wallet<bool, u128> and the other of 
    //Wallet<felt252, u8>. Then, we call mixup and create a new Wallet<bool, u8> instance.
    let w1: Wallet<bool, u128> = Wallet { balance: true, address: 10 };
    let w2: Wallet<felt252, u8> = Wallet { balance: 32, address: 100 };

    let w3 = w1.mixup(w2);

    assert!(w3.balance);
    assert!(w3.address == 100);
}
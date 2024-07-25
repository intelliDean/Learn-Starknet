fn new_function() {
    println!("This is a new function");
}

fn function_with_param(name: ByteArray, age: u8) {
    println!("My name is {} and I am {} years old", name, age);
}

fn function_call_with_named_param(name: ByteArray, age: u8) {
    println!("My name is {} and I am {} years old", name, age);
}

fn function_calls() {
    //this will be possible if you know the name of the parameters
    function_call_with_named_param(name: "Michael Dean", age: 12);
}

//Statements are instructions that perform some action and do not return a value.
//for example: creating a variable and assigning a value to it with the let keyword is a statement. function definitions are also statements
//Statements do not return values. Therefore, you can’t assign a let statement to another variable like this => let x = (let y = 6);

//Expressions evaluate to a resultant value.
fn expression() {
    let ux = {
        let uy = 6;
    };

    let y = {
        let x = 3;
        x + 1 //this line does not have a semicolon
    //Expressions do not include ending semicolons. If you add a semicolon to the end of an expression, you turn it into a statement, and it will then not return a value.
    };

    println!("The value of y is: {}", y);
    println!("The value of ux is: {}", ux);
}

fn function_with_return_value() -> bool {
    let number: u256 = 4390;

    return  number > 4000;
}

fn increase_param(number: u32) -> u32 {
    return number + 1;
}

fn assert_result() {
    if (increase_param(10) == 11) {
        println!("True");
    }
}

fn if_expression() {
    let number = {
        let x = 3;
        if (x % 2 == 0) {
            10
        } else {
            15
        }
    };

    if number % 2 == 0 {
        println!("It is even");
    } else {
        println!("it is odd");
    }
}

fn multiple_if() {
    let number = 3;

    if number == 12 {
        println!("number is 12");
    } else if number == 3 {
        println!("number is 3");
    } else if number - 2 == 1 {
        println!("number minus 2 is 1");
    } else {
        println!("number not found");
    }
}

fn if_in_let() {
    let isGreater = 5 > 0; //this will assign true

    let number = if isGreater {
        5
    } else {
        0
    };

    if number == 5 {
        println!("condition was true and number is {}", number);
    }
}

fn repitition() {
    loop {
        println!("looping forever");
    }
}

fn finite_loop() {
    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        println!("i = {}", i);
        i += 1;
    }
}

fn loop_with_continue() {
    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("i = {}", i);
        i += 1;
    }
}

fn loop_with_return() {
    let mut counter = 0;

    let result = loop {
        if counter == 10 {
            break counter * 2;
        }
        counter += 1;
    };

    println!("The result is {}", result);
}

fn while_loop() {
    let mut number = 3;

    while number != 0 {
        println!("{number}!");
        number -= 1;
    };

    println!("LIFTOFF!!!");
}

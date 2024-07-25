//longer way
fn find_max_longer() {
    let config_max = Option::Some(5);
    match config_max {
        Option::Some(max) => println!("The maximum is configured to be {}", max),
        _ => (),
    }
}

//Using if let means less typing, less indentation, and less boilerplate code.
//However, you lose the exhaustive checking that match enforces.

//concise way
fn find_max_concise() {
    let number = Option::Some(5);
    if let Option::Some(max) = number {
        println!("The maximum is configured to be {}", max);
    }
}


fn func() {
    let coin = Coin::Quarter;
    let mut count = 0;
    match coin {
        Coin::Quarter => println!("You got a quarter!"),
        _ => count += 1,
    }
}

//if.. let.. else
fn if_let_else() {
    let coin = Coin::Quarter;
    let mut count = 0;
    if let Coin::Quarter = coin {
        println!("You got a quarter!");
    } else {
        count += 1;
    }
}


//while.. let
fn while_let() {
    let mut arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9];
    let mut sum = 0;
    while let Option::Some(value) = arr.pop_front() {
        sum += value;
    };
    println!("{}", sum);
}
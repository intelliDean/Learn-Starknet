fn dict() {
    let mut balances: Felt252Dict<u64> = Default::default();

    balances.insert('Alex', 100);
    balances.insert('Maria', 200);

    let alex_bal = balances.get('Alex');
    assert!(alex_bal == 100, "Not Alex balance");

    let maria_bal = balances.get('Maria');
    assert!(maria_bal == 200, "Not Maria balance");

    
}
//Cairo is at its core a non-deterministic Turing-complete programming language,
//very different from any other popular language in existence, which as a 
//consequence means that dictionaries are implemented very differently as well!

//One of the purposes of Cairo is, with the STARK proof system, to generate 
//proofs of computational integrity. 
//Methods are similar to functions: we declare them with the fn keyword and a name, 
//they can have parameters and a return value, and they contain some code that’s run 
//when the method is called from somewhere else. Unlike functions, methods are defined 
//within the context of a struct (or an enum which we cover in Chapter 6), and their 
//first parameter is always self, which represents the instance of the type the 
//method is being called on.

#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

// trait RectangleTrait {
//     fn area(self: @Rectangle) -> u64;
// }

//instead of creating the above RectangleTrait
//#[generate_trait] is used to inform the compiler to auto-generate the trait

#[generate_trait]
impl RectangleImpl of RectangleTrait {
    //method can take snaptshots
    fn area(self: @Rectangle) -> u64 {
        (*self.width) * (*self.height)
    }

    //methods can also take mutable reference
    fn scale(ref self: Rectangle, factor: u64) {
        self.width *= factor;
        self.height *= factor;
    }

    //method that can take several paramenter
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }

    //creating an associate function but without self
    //this associate function is used to create a new Rectangle
    fn new(width: u64, height: u64) -> Rectangle {
        Rectangle { width, height }
    }

    fn square(size: u64) -> Rectangle {
        Rectangle { width: size, height: size }
    }

    fn avg(lhs: @Rectangle, rhs: @Rectangle) -> Rectangle {
        Rectangle {
            width: ((*lhs.width) + (*rhs.width)) / 2, height: ((*lhs.height) + (*rhs.height)) / 2
        }
    }
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50, };
    let rect2 = Rectangle { width: 10, height: 40, };
    let rect3 = Rectangle { width: 60, height: 45, };

    println!("Area is {}", rect1.area());

    rect2.scale(2);
    println!("The new size is (width: {}, height: {})", rect2.width, rect2.height);

    println!("Can rect1 hold rect2? {}", rect1.can_hold(@rect2));
    println!("Can rect1 hold rect3? {}", rect1.can_hold(@rect3));

    //notice that when new and square functions are called, they are called with 
    //the trait name and ::
    //unlike the methods with self that is called with the instance of the trait
    //this is like the static methods in Java that is called with the class name 
    //instead of the instance of the class
    let rect4 = RectangleTrait::new(30, 50);
    let rect5 = RectangleTrait::square(10);

    println!(
        "The average Rectangle of {:?} and {:?} is {:?}",
        @rect4,
        @rect5,
        RectangleTrait::avg(@rect4, @rect5)
    );
}
//Associated functions
//Associated functions are all functions that are defined inside 
//an impl block that are associated to a specific type.

//Multiple Traits and impl Blocks
//Each struct is allowed to have multiple trait and impl blocks. 

#[derive(Drop, Copy)]
struct Human {
    name: ByteArray,
    age: u8,
}

#[generate_trait]
impl IntroHumanImpl of IntroHuman {
    fn introduceHuman(self: @Human) {
        println!("Hello, my name is {} and I am {} years old", *self.name, *self.age)
    }
}

#[generate_trait]
impl CompareHumanAgeImpl of CompareHumanAge {
    fn compare_human_age(self: @Human, other: @Human) -> Human {
        if *self.age > *other.age {
            return self;
        } else {
            return other;
        }
    }
}

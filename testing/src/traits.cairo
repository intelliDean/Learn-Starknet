// A trait defines a set of methods that can be implemented by a type. 
// Note: Traits are similar to a feature often called interfaces 
// in other languages, although with some differences.

// Trait definitions are a way to group method signatures together
// to define a set of behaviors necessary to accomplish some purpose.

//TRAIT DECLARARION (NON-GENERIC)
pub trait Summary {
    fn summarize(self: @NewsArticle) -> ByteArray;
}


// GENERIC

pub trait Summary<T> {
    fn summarize(self: @T) -> ByteArray;
}

//A trait can have multiple methods in its body: the method signatures 
// are listed one per line and each line ends in a semicolon.

#[derive(Drop)]
pub struct NewsArticle {
    pub headline: ByteArray,
    pub location: ByteArray,
    pub author: ByteArray,
    pub content: ByteArray,
}

impl NewsArticleSummary of Summary<NewsArticle> {
    fn summarize(self: @NewsArticle) -> ByteArray {
        format!("{} by {} ({})", self.headline, self.author, self.location)
    }
}

#[derive(Drop)]
pub struct Tweet {
    pub username: ByteArray,
    pub content: ByteArray,
    pub reply: bool,
    pub retweet: bool,
}

impl TweetSummary of Summary<Tweet> {
    fn summarize(self: @Tweet) -> ByteArray {
        format!("{}: {}", self.username, self.content)
    }
}


//DEFAULT IMPLEMENTATION
pub trait Summary<T> {
    fn summarize(
        self: @T
    ) -> ByteArray { //calling another method in the same trait
        format!("(Read more from {}...)", Self::summarize_author(self))
    }

    fn summarize_author(self: @T) -> ByteArray;
}

impl TweetSummary of Summary<Tweet> {
    fn summarize_author(self: @Tweet) -> ByteArray {
        format!("@{}", self.username)
    }
}


use aggregator::{Summary, NewsArticle, Tweet};


fn main() {
    let news = NewsArticle {
        headline: "Cairo has become the most popular language for developers",
        location: "Worldwide",
        author: "Cairo Digger",
        content: "Cairo is a new programming language for zero-knowledge proofs",
    };

    let tweet = Tweet {
        username: "EliBenSasson",
        content: "Crypto is full of short-term maximizing projects. \n @Starknet and @StarkWareLtd are about long-term vision maximization.",
        reply: false,
        retweet: false
    }; // Tweet instantiation

    println!("New article available! {}", news.summarize());
    println!("New tweet! {}", tweet.summarize());
}

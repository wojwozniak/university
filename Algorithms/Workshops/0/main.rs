use std::io;

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();

    let nums: Vec<i32> = input
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();

    let (mut a, mut b) = (nums[0], nums[1]);

    if a > b {
        (a, b) = (b, a);
    }

    for i in a..=b {
        println!("{}", i);
    }
}
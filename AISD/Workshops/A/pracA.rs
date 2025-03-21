use std::collections::VecDeque;
use std::io;

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: u32 = input.trim().parse().unwrap();

    let mut graph = vec![vec![]; 10001 as usize];
    let mut ever_in_queue = vec![false; 10001 as usize];
    let mut queue = VecDeque::new();
    let mut passes = vec![(u16::MAX, u16::MAX); 10001 as usize];

    for _ in 0..n {
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        let parts: Vec<u16> = input
            .trim()
            .split_whitespace()
            .map(|s| s.parse().unwrap())
            .collect();
        let start = parts[0];
        let weight = parts[1];
        let target = parts[2];

        graph[target as usize].push((start, weight));
    }

    queue.push_back(0);
    ever_in_queue[0] = true;

    while let Some(current) = queue.pop_front() {
        for edge in graph[current as usize].iter() {
            let (from, weight) = edge;

            if passes[*from as usize].0 == u16::MAX {
                passes[*from as usize] = (current, *weight);
                queue.push_back(*from);
                ever_in_queue[*from as usize] = true;
            } else {
                if !ever_in_queue[*from as usize] {
                    queue.push_back(*from);
                    ever_in_queue[*from as usize] = true;
                }
            }
        }
    }

    if passes[0].0 == u16::MAX {
        println!("BRAK");
    } else {
        let mut current = passes[0].0;
        let mut length = 1;
        while current != 0 {
            length += 1;
            current = passes[current as usize].0;
        }

        println!("{}", length);

        println!("{} {} {}", 0, passes[0].1, passes[0].0);
        let mut current = passes[0].0;
        while current != 0 {
            println!(
                "{} {} {}",
                current, passes[current as usize].1, passes[current as usize].0
            );
            current = passes[current as usize].0;
        }
    }
}

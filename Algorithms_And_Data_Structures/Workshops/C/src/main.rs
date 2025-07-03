use std::collections::HashSet;
use std::io;

fn idx(i1: usize, i2: usize, i3: usize) -> usize {
    i1 * 32 * 32 + i2 * 32 + i3
}

fn flat(i1: usize, i2: usize) -> usize {
    i1 * 32 + i2
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let nums: Vec<usize> = input
        .trim()
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let n = nums[0];
    let p = nums[1];
    let m = nums[2] as u32;

    let mut forbidden = HashSet::new();

    for _ in 0..p {
        let mut pattern = String::new();
        for _ in 0..3 {
            input.clear();
            io::stdin().read_line(&mut input).unwrap();
            pattern.push_str(input.trim());
        }

        let casted: u16 = pattern
            .chars()
            .rev()
            .enumerate()
            .filter(|&(_, c)| c == 'x')
            .fold(0, |acc, (i, _)| acc | (1 << i));

        forbidden.insert(casted);
    }

    let mut forbidden_table = vec![false; 32 * 32 * 32];
    for i1 in 0..=31 {
        for i2 in 0..=31 {
            for i3 in 0..=31 {
                for s in 0..=2 {
                    let mut pattern: u16 = 0;
                    for r in 0..3 {
                        let row = s + r;
                        if (i1 >> row) & 1 == 1 {
                            pattern |= 1 << (r * 3);
                        }
                        if (i2 >> row) & 1 == 1 {
                            pattern |= 1 << (r * 3 + 1);
                        }
                        if (i3 >> row) & 1 == 1 {
                            pattern |= 1 << (r * 3 + 2);
                        }
                    }

                    if forbidden.contains(&pattern) {
                        forbidden_table[idx(i1, i2, i3)] = true;
                    }
                }
            }
        }
    }

    let mut dp = vec![1u32; 32 * 32];
    let mut new_dp = vec![0u32; 32 * 32];

    for _ in 2..n {
        new_dp.fill(0u32);

        for i1 in 0..=31 {
            for i2 in 0..=31 {
                let dp_val = dp[flat(i1, i2)];
                if dp_val > 0 {
                    for i3 in 0..=31 {
                        if !forbidden_table[idx(i1, i2, i3)] {
                            let pos = flat(i2, i3);
                            new_dp[pos] = (new_dp[pos] + dp_val) % m;
                        }
                    }
                }
            }
        }

        std::mem::swap(&mut dp, &mut new_dp);
    }

    let result: u32 = dp.iter().fold(0, |acc, &x| (acc + x) % m);
    println!("{}", result);
}

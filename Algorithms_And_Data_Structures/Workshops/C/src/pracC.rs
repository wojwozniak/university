use std::collections::HashSet;
use std::io;

fn generate_forbidden_hashset(p: usize) -> HashSet<u16> {
    let mut forbidden = HashSet::new();
    let mut input = String::new();

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

    forbidden
}

fn contains_forbidden_pattern(i1: usize, i2: usize, i3: usize, forbidden: &HashSet<u16>) -> bool {
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
            return true;
        }
    }

    false
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

    let forbidden = generate_forbidden_hashset(p);
    let mut dp: Vec<Vec<u32>> = vec![vec![1; 32]; 32];
    let mut new_dp: Vec<Vec<u32>> = vec![vec![0; 32]; 32];

    for _ in 2..n {
        for row in new_dp.iter_mut() {
            row.fill(0);
        }

        for i1 in 0..=31 {
            for i2 in 0..=31 {
                if dp[i1][i2] > 0 {
                    for i3 in 0..=31 {
                        if !contains_forbidden_pattern(i1, i2, i3, &forbidden) {
                            new_dp[i2][i3] = (new_dp[i2][i3] + dp[i1][i2]) % m;
                        }
                    }
                }
            }
        }
        std::mem::swap(&mut dp, &mut new_dp);
    }

    let mut result = 0;
    for i1 in 0..=31 {
        for i2 in 0..=31 {
            result = (result + dp[i1][i2]) % m;
        }
    }

    println!("{}", result);
}

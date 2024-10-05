// # Task 2 # - Bit Counting
// cd w odpowiednie directory i cargo test

/* Funkcja minimalna - korzystamy z wbudowanego count_ones() */
fn count_bits(n: i64) -> u32 {
    n.count_ones()
}

/*
    Zadanie jest bazowo za cztery punkty - robię też więc manualnie
    (typowy algorytm na bitach) w razie jakby było to potrzebne
*/
fn count_bits_manually(n: i64) -> u32 {
    let mut count = 0;
    let mut num = n;

    while num != 0 {
        if num & 1 == 1 {
            count += 1;
        }
        num >>= 1;
    }

    count
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn unit_tests() {
        assert_eq!(count_bits(0), 0);
        assert_eq!(count_bits(4), 1);
        assert_eq!(count_bits(7), 3);
        assert_eq!(count_bits(9), 2);
        assert_eq!(count_bits(10), 2);
    }

    #[test]
    fn unit_tests_manual() {
        assert_eq!(count_bits_manually(0), 0);
        assert_eq!(count_bits_manually(4), 1);
        assert_eq!(count_bits_manually(7), 3);
        assert_eq!(count_bits_manually(9), 2);
        assert_eq!(count_bits_manually(10), 2);
    }
}

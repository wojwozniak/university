fn last_digit(a: &str, b: &str) -> u32 {
    // Using knowledge from MD(L) class, we know that we only need last digit
    // of base and last two digits of the exponent
    // Last digit of power of any number goes in a cycle (of length 1, 2, 4)

    // Get last number as digit
    let last_digit_a: u32 = a.chars().last().unwrap().to_digit(10).unwrap();

    // a^0 = 1
    if b == "0" {
        return 1;
    }

    // 0^b = 0; b!=0
    if a == "0" {
        return 0;
    }

    // Get last digits of b
    let last_digits_b: u32;

    // We take out two last numbers of b to protect ourselves from potential
    // problems that could occur if b > 2^32 - 1
    if b.len() > 2 {
        last_digits_b = b[b.len() - 2..].parse::<u32>().unwrap() % 4;
    } else {
        last_digits_b = b.parse::<u32>().unwrap() % 4;
    }

    // Define cycles for last digits from 0 to 9
    let cycles: Vec<Vec<u32>> = vec![
        vec![0],          // 0
        vec![1],          // 1
        vec![2, 4, 8, 6], // 2
        vec![3, 9, 7, 1], // 3
        vec![4, 6],       // 4
        vec![5],          // 5
        vec![6],          // 6
        vec![7, 9, 3, 1], // 7
        vec![8, 4, 2, 6], // 8
        vec![9, 1],       // 9
    ];

    // Define exponent -> we shift from 0-3 to 1-4 because we will still have
    // to subtract in index (our cycles are 1-indexed)
    let exponent = if last_digits_b == 0 { 4 } else { last_digits_b };

    // We need to convert our values to usize as we will use them to access
    // elements of vectors (usize is functionally sizeof(T)??? sth like that)
    let cycle_index: usize = last_digit_a as usize;

    // Cycles differ in size so we have to modulo our exponent to correct val
    let selected_cycle_length: usize = cycles[cycle_index].len();

    // Adjust exponent for selected cycle length and 1-indexness of our cycles
    let exponent_index: usize = (exponent as usize - 1) % selected_cycle_length;

    // Find the result by using the correct cycle and exponent
    cycles[cycle_index][exponent_index]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_last_digit_4_1() {
        assert_eq!(last_digit("4", "1"), 4);
    }

    #[test]
    fn test_last_digit_4_2() {
        assert_eq!(last_digit("4", "2"), 6);
    }

    #[test]
    fn test_last_digit_9_7() {
        assert_eq!(last_digit("9", "7"), 9);
    }

    #[test]
    fn test_last_digit_10_10000000000() {
        assert_eq!(last_digit("10", "10000000000"), 0);
    }

    #[test]
    fn test_last_digit_large_numbers() {
        assert_eq!(last_digit("123456789", "987654321"), 9);
    }

    #[test]
    fn test_last_digit_2_100() {
        assert_eq!(last_digit("2", "100"), 6);
    }

    #[test]
    fn test_last_digit_0_0() {
        assert_eq!(last_digit("0", "0"), 1);
    }

    #[test]
    fn test_last_digit_3_3() {
        assert_eq!(last_digit("3", "3"), 7);
    }

    #[test]
    fn test_last_digit_7_0() {
        assert_eq!(last_digit("7", "0"), 1);
    }

    #[test]
    fn test_last_digit_2_10() {
        assert_eq!(last_digit("2", "10"), 4);
    }

    #[test]
    fn test_last_digit_2_211() {
        assert_eq!(last_digit("2", "211"), 8);
    }
}

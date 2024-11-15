// The most obvious solution would be to do a while loop
// that goes down from top, but there is a more efficient
// solution - integer division and then modulo
fn coin_combo(mut cents: u32) -> [u32; 4] {
    let quarters = cents / 25;
    cents %= 25;
    let dimes = cents / 10;
    cents %= 10;
    let nickels = cents / 5;
    cents %= 5;
    let pennies = cents;

    [pennies, nickels, dimes, quarters]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_case_1() {
        assert_eq!(coin_combo(6), [1, 1, 0, 0]);
    }

    #[test]
    fn test_case_2() {
        assert_eq!(coin_combo(0), [0, 0, 0, 0]);
    }

    #[test]
    fn test_case_3() {
        assert_eq!(coin_combo(25), [0, 0, 0, 1]);
    }

    #[test]
    fn test_case_4() {
        assert_eq!(coin_combo(99), [4, 0, 2, 3]);
    }

    #[test]
    fn test_case_5() {
        assert_eq!(coin_combo(41), [1, 1, 1, 1]);
    }

    #[test]
    fn test_case_6() {
        assert_eq!(coin_combo(7), [2, 1, 0, 0]);
    }

    #[test]
    fn test_case_7() {
        assert_eq!(coin_combo(50), [0, 0, 0, 2]);
    }

    #[test]
    fn test_case_8() {
        assert_eq!(coin_combo(15), [0, 1, 1, 0]);
    }

    #[test]
    fn test_case_9() {
        assert_eq!(coin_combo(3), [3, 0, 0, 0]);
    }

    #[test]
    fn test_case_10() {
        assert_eq!(coin_combo(87), [2, 0, 1, 3]);
    }
}

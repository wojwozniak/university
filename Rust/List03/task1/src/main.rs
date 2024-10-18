fn row_sum_odd_numbers(n: i64) -> i64 {
    // I noticed that solution is just n^3
    return n * n * n;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_first_row() {
        assert_eq!(row_sum_odd_numbers(1), 1);
    }

    #[test]
    fn test_second_row() {
        assert_eq!(row_sum_odd_numbers(2), 8);
    }

    #[test]
    fn test_third_row() {
        assert_eq!(row_sum_odd_numbers(3), 27);
    }

    #[test]
    fn test_fourth_row() {
        assert_eq!(row_sum_odd_numbers(4), 64);
    }

    #[test]
    fn test_tenth_row() {
        assert_eq!(row_sum_odd_numbers(10), 1000);
    }

    #[test]
    fn test_large_row_100() {
        assert_eq!(row_sum_odd_numbers(100), 1_000_000);
    }

    #[test]
    fn test_fifth_row() {
        assert_eq!(row_sum_odd_numbers(5), 125);
    }

    #[test]
    fn test_sixth_row() {
        assert_eq!(row_sum_odd_numbers(6), 216);
    }

    #[test]
    fn test_fifteenth_row() {
        assert_eq!(row_sum_odd_numbers(15), 3375);
    }

    #[test]
    fn test_twentieth_row() {
        assert_eq!(row_sum_odd_numbers(20), 8000);
    }
}

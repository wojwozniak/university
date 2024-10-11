fn summy(s: &str) -> i32 {
    s.split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .sum()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_multiple_positive_integers() {
        assert_eq!(summy("1 2 3 4 5"), 15);
    }

    #[test]
    fn test_negative_integers() {
        assert_eq!(summy("-1 -2 -3"), -6);
    }

    #[test]
    fn test_mixed_integers() {
        assert_eq!(summy("10 -3 7 -1"), 13);
    }

    #[test]
    fn test_single_integer() {
        assert_eq!(summy("42"), 42);
    }

    #[test]
    fn test_empty_string() {
        assert_eq!(summy(""), 0);
    }
}

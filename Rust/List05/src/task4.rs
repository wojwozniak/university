fn order_weight(s: &str) -> String {
    let mut weights: Vec<&str> = s.split_whitespace().collect();

    weights.sort_by(|a, b| {
        let weight_a: u32 = a.chars().map(|c| c.to_digit(10).unwrap()).sum();
        let weight_b: u32 = b.chars().map(|c| c.to_digit(10).unwrap()).sum();
        weight_a.cmp(&weight_b).then_with(|| a.cmp(b))
    });

    weights.join(" ")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_single_number() {
        assert_eq!(order_weight("100"), "100");
    }

    #[test]
    fn test_multiple_same_weight() {
        assert_eq!(
            order_weight("56 65 74 100 99 68 86 180"),
            "100 180 56 65 74 68 86 99"
        );
    }

    #[test]
    fn test_order_by_lexicographical_when_same_weight() {
        assert_eq!(
            order_weight("56 65 74 100 99 68 86 180 90"),
            "100 180 90 56 65 74 68 86 99"
        );
    }

    #[test]
    fn test_empty_string() {
        assert_eq!(order_weight(""), "");
    }

    #[test]
    fn test_multiple_weights_with_ties() {
        assert_eq!(
            order_weight("2000 103 123 4444 99 2000"),
            "2000 2000 103 123 4444 99"
        );
    }

    #[test]
    fn test_zeroes() {
        assert_eq!(order_weight("0 00 000"), "0 00 000");
    }

    #[test]
    fn test_large_numbers() {
        assert_eq!(order_weight("12345 6789 123 456"), "123 12345 456 6789");
    }

    #[test]
    fn test_mixed_weights() {
        assert_eq!(order_weight("56 90 12 1 98 2"), "1 2 12 90 56 98");
    }

    #[test]
    fn test_trailing_whitespace() {
        assert_eq!(
            order_weight("100 180 90 56 65 74 68 86 99 "),
            "100 180 90 56 65 74 68 86 99"
        );
    }

    #[test]
    fn test_leading_whitespace() {
        assert_eq!(
            order_weight(" 100 180 90 56 65 74 68 86 99"),
            "100 180 90 56 65 74 68 86 99"
        );
    }
}

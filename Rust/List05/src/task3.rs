fn round_by_half(value: f64) -> f64 {
    (value * 2.0).round() / 2.0
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_round_2_3() {
        assert_eq!(round_by_half(2.3), 2.5);
    }

    #[test]
    fn test_round_2_25() {
        assert_eq!(round_by_half(2.25), 2.5);
    }

    #[test]
    fn test_round_2_6() {
        assert_eq!(round_by_half(2.6), 2.5);
    }

    #[test]
    fn test_round_2_8() {
        assert_eq!(round_by_half(2.8), 3.0);
    }

    #[test]
    fn test_round_3_3() {
        assert_eq!(round_by_half(3.3), 3.5);
    }

    #[test]
    fn test_round_3_7() {
        assert_eq!(round_by_half(3.7), 3.5);
    }

    #[test]
    fn test_round_4_2() {
        assert_eq!(round_by_half(4.2), 4.0);
    }

    #[test]
    fn test_round_neg_2_3() {
        assert_eq!(round_by_half(-2.3), -2.5);
    }

    #[test]
    fn test_round_neg_2_6() {
        assert_eq!(round_by_half(-2.6), -2.5);
    }

    #[test]
    fn test_round_neg_2_8() {
        assert_eq!(round_by_half(-2.8), -3.0);
    }
}

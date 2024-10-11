fn letter_range(s: &str) -> String {
    let (start, end) = s.split_once('-').unwrap();
    let start_char = start.chars().next().unwrap();
    let end_char = end.chars().next().unwrap();
    (start_char..=end_char).collect()
}
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_lowercase_alphabet_range() {
        assert_eq!(letter_range("a-e"), "abcde");
    }

    #[test]
    fn test_adjacent_letters() {
        assert_eq!(letter_range("x-z"), "xyz");
    }

    #[test]
    fn test_same_start_and_end_letter() {
        assert_eq!(letter_range("g-g"), "g");
    }

    #[test]
    fn test_uppercase_letters() {
        assert_eq!(letter_range("A-D"), "ABCD");
    }

    #[test]
    fn test_reverse_order_invalid_range() {
        assert_eq!(letter_range("d-a"), "");
    }
}

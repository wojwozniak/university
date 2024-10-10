fn get_count(string: &str) -> usize {
    string
        .to_lowercase()
        .chars()
        .filter(|&c| "aeiou".contains(c))
        .count()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_lowercase_vowels() {
        assert_eq!(get_count("hello"), 2);
    }

    #[test]
    fn test_uppercase_vowels() {
        assert_eq!(get_count("HELLO"), 2);
    }

    #[test]
    fn test_mixed_case_special_chars() {
        assert_eq!(get_count("H3ll0 W0rld!"), 0);
    }

    #[test]
    fn test_empty_string() {
        assert_eq!(get_count(""), 0);
    }

    #[test]
    fn test_no_vowels() {
        assert_eq!(get_count("rhythm"), 0);
    }
}

use std::collections::HashSet;

fn longest(s1: &str, s2: &str) -> String {
    let mut char_set = HashSet::new();

    for c in s1.chars().chain(s2.chars()) {
        char_set.insert(c);
    }

    let mut chars: Vec<_> = char_set.into_iter().collect();

    chars.sort();

    chars.into_iter().collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashSet;

    #[test]
    fn test_overlapping_characters() {
        assert_eq!(longest("abc", "bcd"), "abcd");
    }

    #[test]
    fn test_distinct_characters() {
        assert_eq!(longest("xyz", "abc"), "abcxyz");
    }

    #[test]
    fn test_empty_second_string() {
        assert_eq!(longest("hello", ""), "ehlo");
    }

    #[test]
    fn test_both_strings_empty() {
        assert_eq!(longest("", ""), "");
    }

    #[test]
    fn test_empty_first_string() {
        assert_eq!(longest("", "hello"), "ehlo");
    }
}

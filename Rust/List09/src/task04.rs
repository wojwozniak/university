fn spin_words(sentence: &str) -> String {
    sentence
        .split_whitespace()
        .map(|word| {
            if word.len() >= 5 {
                word.chars().rev().collect::<String>()
            } else {
                word.to_string()
            }
        })
        .collect::<Vec<String>>()
        .join(" ")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_single_word_no_reverse() {
        assert_eq!(spin_words("Hey"), "Hey");
    }

    #[test]
    fn test_single_word_reverse() {
        assert_eq!(spin_words("Hello"), "olleH");
    }

    #[test]
    fn test_multiple_words_with_reversals() {
        assert_eq!(spin_words("Hey fellow warriors"), "Hey wollef sroirraw");
    }

    #[test]
    fn test_multiple_words_no_reversal() {
        assert_eq!(spin_words("This is a test"), "This is a test");
    }

    #[test]
    fn test_mixed_reversal() {
        assert_eq!(spin_words("This is another test"), "This is rehtona test");
    }
}

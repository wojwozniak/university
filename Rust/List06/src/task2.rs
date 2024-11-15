pub fn wave(s: &str) -> Vec<String> {
    let mut result = Vec::new();

    for (i, c) in s.chars().enumerate() {
        let mut wave_str = s.to_string();
        if c != ' ' {
            wave_str.replace_range(i..i + 1, &c.to_uppercase().to_string());
            result.push(wave_str);
        }
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_wave_hello() {
        assert_eq!(wave("hello"), ["Hello", "hEllo", "heLlo", "helLo", "hellO"]);
    }

    #[test]
    fn test_wave_empty_string() {
        assert_eq!(wave(""), Vec::<String>::new());
    }

    #[test]
    fn test_wave_single_character() {
        assert_eq!(wave("a"), ["A"]);
    }

    #[test]
    fn test_wave_with_spaces() {
        assert_eq!(
            wave("hello world"),
            [
                "Hello world",
                "hEllo world",
                "heLlo world",
                "helLo world",
                "hellO world",
                "hello World",
                "hello wOrld",
                "hello woRld",
                "hello worLd",
                "hello worlD"
            ]
        );
    }

    #[test]
    fn test_wave_with_multiple_spaces() {
        assert_eq!(wave("a b c"), ["A b c", "a B c", "a b C"]);
    }

    #[test]
    fn test_wave_no_spaces() {
        assert_eq!(wave("abc"), ["Abc", "aBc", "abC"]);
    }

    #[test]
    fn test_wave_big_space() {
        assert_eq!(
            wave("a                                    b"),
            [
                "A                                    b",
                "a                                    B"
            ]
        );
    }

    #[test]
    fn test_wave_single_space_between_characters() {
        assert_eq!(wave("a b"), ["A b", "a B"]);
    }

    #[test]
    fn test_wave_multiple_spaces_at_start() {
        assert_eq!(
            wave("  hello"),
            ["  Hello", "  hEllo", "  heLlo", "  helLo", "  hellO"]
        );
    }

    #[test]
    fn test_wave_multiple_spaces_at_end() {
        assert_eq!(
            wave("hello  "),
            ["Hello  ", "hEllo  ", "heLlo  ", "helLo  ", "hellO  "]
        );
    }
}

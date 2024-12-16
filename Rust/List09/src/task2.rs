fn accum(s: &str) -> String {
    let mut result = Vec::new();
    let mut index = 0;

    for c in s.chars() {
        let mut part = c.to_uppercase().to_string();
        let to_push = c.to_lowercase().to_string().chars().next().unwrap();

        for _ in 0..index {
            part.push(to_push);
        }

        result.push(part);
        index += 1;
    }

    result.join("-")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_empty_string() {
        assert_eq!(accum(""), "");
    }

    #[test]
    fn test_single_character() {
        assert_eq!(accum("a"), "A");
    }

    #[test]
    fn test_repeated_characters() {
        assert_eq!(accum("aa"), "A-Aa");
    }

    #[test]
    fn test_mixed_case() {
        assert_eq!(accum("AbC"), "A-Bb-Ccc");
    }

    #[test]
    fn test_multiple_words() {
        assert_eq!(accum("abcd"), "A-Bb-Ccc-Dddd");
    }

    #[test]
    fn test_long_string() {
        assert_eq!(
            accum("abcdefghij"),
            "A-Bb-Ccc-Dddd-Eeeee-Ffffff-Ggggggg-Hhhhhhhh-Iiiiiiiii-Jjjjjjjjjj"
        );
    }

    #[test]
    fn test_uppercase_characters() {
        assert_eq!(accum("ABCDE"), "A-Bb-Ccc-Dddd-Eeeee");
    }

    #[test]
    fn test_single_repeated_character() {
        assert_eq!(accum("zzzzzz"), "Z-Zz-Zzz-Zzzz-Zzzzz-Zzzzzz");
    }

    #[test]
    fn test_reverse_order() {
        assert_eq!(accum("zyxwv"), "Z-Yy-Xxx-Wwww-Vvvvv");
    }

    #[test]
    fn test_reverse_order_repeated() {
        assert_eq!(accum("zyxwvy"), "Z-Yy-Xxx-Wwww-Vvvvv-Yyyyyy");
    }
}

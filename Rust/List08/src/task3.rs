fn partlist(arr: Vec<&str>) -> Vec<(String, String)> {
    let mut result = Vec::new();

    for i in 1..arr.len() {
        let first_part = arr[0..i].join(" ");
        let second_part = arr[i..].join(" ");
        result.push((first_part, second_part));
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_example1() {
        let a = vec!["az", "toto", "picaro", "zone", "kiwi"];
        let result = partlist(a);
        let expected = vec![
            ("az".to_string(), "toto picaro zone kiwi".to_string()),
            ("az toto".to_string(), "picaro zone kiwi".to_string()),
            ("az toto picaro".to_string(), "zone kiwi".to_string()),
            ("az toto picaro zone".to_string(), "kiwi".to_string()),
        ];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_example2() {
        let a = vec!["a", "b", "c", "d"];
        let result = partlist(a);
        let expected = vec![
            ("a".to_string(), "b c d".to_string()),
            ("a b".to_string(), "c d".to_string()),
            ("a b c".to_string(), "d".to_string()),
        ];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_single_split() {
        let a = vec!["one", "two"];
        let result = partlist(a);
        let expected = vec![("one".to_string(), "two".to_string())];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_empty_list() {
        let a: Vec<&str> = vec![];
        let result = partlist(a);
        let expected: Vec<(String, String)> = vec![];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_one_element() {
        let a = vec!["only"];
        let result = partlist(a);
        let expected: Vec<(String, String)> = vec![];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_long_list() {
        let a = vec!["a", "b", "c", "d", "e", "f"];
        let result = partlist(a);
        let expected = vec![
            ("a".to_string(), "b c d e f".to_string()),
            ("a b".to_string(), "c d e f".to_string()),
            ("a b c".to_string(), "d e f".to_string()),
            ("a b c d".to_string(), "e f".to_string()),
            ("a b c d e".to_string(), "f".to_string()),
        ];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_duplicate_elements() {
        let a = vec!["a", "a", "b"];
        let result = partlist(a);
        let expected = vec![
            ("a".to_string(), "a b".to_string()),
            ("a a".to_string(), "b".to_string()),
        ];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_all_single_words() {
        let a = vec!["apple", "banana", "cherry"];
        let result = partlist(a);
        let expected = vec![
            ("apple".to_string(), "banana cherry".to_string()),
            ("apple banana".to_string(), "cherry".to_string()),
        ];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_repeated_elements() {
        let a = vec!["x", "x", "x", "x"];
        let result = partlist(a);
        let expected = vec![
            ("x".to_string(), "x x x".to_string()),
            ("x x".to_string(), "x x".to_string()),
            ("x x x".to_string(), "x".to_string()),
        ];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_multiple_spaces() {
        let a = vec!["hello", "world", "this", "is", "rust"];
        let result = partlist(a);
        let expected = vec![
            ("hello".to_string(), "world this is rust".to_string()),
            ("hello world".to_string(), "this is rust".to_string()),
            ("hello world this".to_string(), "is rust".to_string()),
            ("hello world this is".to_string(), "rust".to_string()),
        ];
        assert_eq!(result, expected);
    }
}

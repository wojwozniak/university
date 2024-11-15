fn comp(a: Vec<i32>, b: Vec<i32>) -> bool {
    let mut a_squared: Vec<i32> = a.into_iter().map(|x| x * x).collect();
    let mut b = b;

    a_squared.sort_unstable();
    b.sort_unstable();

    a_squared == b
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_valid_case_1() {
        let a = vec![121, 144, 19, 161, 19, 144, 19, 11];
        let b = vec![121, 14641, 20736, 361, 25921, 361, 20736, 361];
        assert!(comp(a, b));
    }

    #[test]
    fn test_invalid_case_1() {
        let a = vec![121, 144, 19, 161, 19, 144, 19, 11];
        let b = vec![132, 14641, 20736, 361, 25921, 361, 20736, 361];
        assert!(!comp(a, b));
    }

    #[test]
    fn test_invalid_case_2() {
        let a = vec![121, 144, 19, 161, 19, 144, 19, 11];
        let b = vec![121, 14641, 20736, 36100, 25921, 361, 20736, 361];
        assert!(!comp(a, b));
    }

    #[test]
    fn test_valid_small_case() {
        let a = vec![2, 3, 5];
        let b = vec![4, 9, 25];
        assert!(comp(a, b));
    }

    #[test]
    fn test_invalid_small_case() {
        let a = vec![2, 3, 5];
        let b = vec![4, 9, 26];
        assert!(!comp(a, b));
    }

    #[test]
    fn test_empty_arrays() {
        let a: Vec<i32> = vec![];
        let b: Vec<i32> = vec![];
        assert!(comp(a, b));
    }

    #[test]
    fn test_single_element_valid() {
        let a = vec![2];
        let b = vec![4];
        assert!(comp(a, b));
    }

    #[test]
    fn test_single_element_invalid() {
        let a = vec![2];
        let b = vec![5];
        assert!(!comp(a, b));
    }

    #[test]
    fn test_zeroes() {
        let a = vec![0, 0, 0];
        let b = vec![0, 0, 0];
        assert!(comp(a, b));
    }

    #[test]
    fn test_negative_numbers() {
        let a = vec![-2, -3, -4];
        let b = vec![4, 9, 16];
        assert!(comp(a, b));
    }
}

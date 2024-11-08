fn xo(string: &str) -> bool {
    let mut count: i32 = 0;

    for c in string.chars() {
        if c == 'O' || c == 'o' {
            count += 1;
        } else if c == 'x' || c == 'X' {
            count -= 1;
        }
    }

    count == 0
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_xo() {
        assert_eq!(xo("xo"), true);
    }

    #[test]
    fn test_xxoo() {
        assert_eq!(xo("xxoo"), true);
    }

    #[test]
    fn test_xxxooo_true() {
        assert_eq!(xo("xxxooo"), true);
    }

    #[test]
    fn test_xoxo() {
        assert_eq!(xo("xoxo"), true);
    }

    #[test]
    fn test_xxXOoO() {
        assert_eq!(xo("xxXOoO"), true);
    }

    #[test]
    fn test_xxxoo_false() {
        assert_eq!(xo("xxxoo"), false);
    }

    #[test]
    fn test_no_xo_true() {
        assert_eq!(xo("sssss"), true);
    }

    #[test]
    fn test_empty_string() {
        assert_eq!(xo(""), true);
    }

    #[test]
    fn test_single_x_false() {
        assert_eq!(xo("x"), false);
    }

    #[test]
    fn test_single_o_false() {
        assert_eq!(xo("O"), false);
    }
}

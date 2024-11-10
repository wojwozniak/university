fn execute(s: &str) -> String {
    let mut output = String::new();

    output
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_1() {
        assert_eq!(execute(""), "*");
    }

    #[test]
    fn test_2() {
        assert_eq!(execute("FFFFF"), "******");
    }

    #[test]
    fn test_3() {
        assert_eq!(
            execute("FFFFFLFFFFFLFFFFFLFFFFFL"),
            "******\r\n*    *\r\n*    *\r\n*    *\r\n*    *\r\n******"
        );
    }

    #[test]
    fn test_4() {
        assert_eq!(
            execute("LFFFFFRFFFRFFFRFFFFFFF"),
            "    ****\r\n    *  *\r\n    *  *\r\n********\r\n    *   \r\n    *   "
        );
    }

    #[test]
    fn test_5() {
        assert_eq!(
            execute("LF5RF3RF3RF7"),
            "    ****\r\n    *  *\r\n    *  *\r\n********\r\n    *   \r\n    *   "
        );
    }
}

// # Task 4 #
fn printer_error(s: &str) -> String {
    let errors = s.chars().filter(|&c| c > 'm').count();
    format!("{}/{}", errors, s.len())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic() {
        assert_eq!(printer_error("aaabbbbhaijjjm"), "0/14");
        assert_eq!(printer_error("aaaxbbbbyyhwawiwjjjwwm"), "8/22");
        assert_eq!(
            printer_error("aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"),
            "3/56"
        );
        assert_eq!(printer_error("aaaabbbbccccddddeeeeeffffggg"), "0/28");
        assert_eq!(printer_error("nopqrstuvwxyz"), "13/13");
    }
}

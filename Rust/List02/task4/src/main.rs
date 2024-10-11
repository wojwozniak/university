fn count_red_beads(n: u32) -> u32 {
    if n < 2 {
        0
    } else {
        2 * (n - 1)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_no_blue_beads() {
        assert_eq!(count_red_beads(0), 0);
    }

    #[test]
    fn test_one_blue_bead() {
        assert_eq!(count_red_beads(1), 0);
    }

    #[test]
    fn test_two_blue_beads() {
        assert_eq!(count_red_beads(2), 2);
    }

    #[test]
    fn test_five_blue_beads() {
        assert_eq!(count_red_beads(5), 8);
    }

    #[test]
    fn test_ten_blue_beads() {
        assert_eq!(count_red_beads(10), 18);
    }
}

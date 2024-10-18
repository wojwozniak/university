fn number(bus_stops: &[(i32, i32)]) -> i32 {
    let mut total = 0;
    for (on, off) in bus_stops {
        total += on;
        total -= off;
    }

    total
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_no_stops() {
        assert_eq!(number(&[]), 0);
    }

    #[test]
    fn test_one_stop_only_on() {
        assert_eq!(number(&[(5, 0)]), 5);
    }

    #[test]
    fn test_one_stop_on_and_off() {
        assert_eq!(number(&[(10, 2)]), 8);
    }

    #[test]
    fn test_two_stops_net_positive() {
        assert_eq!(number(&[(3, 0), (9, 2)]), 10);
    }

    #[test]
    fn test_two_stops_net_zero() {
        assert_eq!(number(&[(3, 0), (2, 3)]), 2);
    }

    #[test]
    fn test_more_off_than_on() {
        assert_eq!(number(&[(3, 0), (4, 5), (0, 2)]), 0);
    }

    #[test]
    fn test_large_numbers() {
        assert_eq!(number(&[(100, 50), (200, 100), (50, 25)]), 175);
    }

    #[test]
    fn test_people_decrease() {
        assert_eq!(number(&[(10, 5), (5, 3), (2, 4)]), 5);
    }

    #[test]
    fn test_alternating_stops() {
        assert_eq!(number(&[(10, 3), (5, 8), (2, 1)]), 5);
    }

    #[test]
    fn test_more_off_last_stop() {
        assert_eq!(number(&[(10, 0), (5, 1), (2, 8)]), 8);
    }
}

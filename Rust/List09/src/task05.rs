fn battle_outcome(good: &str, evil: &str) -> String {
    let good_worth = [1, 2, 3, 3, 4, 10];
    let evil_worth = [1, 2, 2, 2, 3, 5, 10];

    let good_score: i32 = good
        .split_whitespace()
        .zip(good_worth.iter())
        .map(|(count, &worth)| count.parse::<i32>().unwrap() * worth)
        .sum();

    let evil_score: i32 = evil
        .split_whitespace()
        .zip(evil_worth.iter())
        .map(|(count, &worth)| count.parse::<i32>().unwrap() * worth)
        .sum();

    if good_score > evil_score {
        "Battle Result: Good triumphs over Evil".to_string()
    } else if evil_score > good_score {
        "Battle Result: Evil eradicates all trace of Good".to_string()
    } else {
        "Battle Result: No victor on this battle field".to_string()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_good_wins() {
        assert_eq!(
            battle_outcome("0 0 0 0 0 10", "0 0 0 0 0 0 0"),
            "Battle Result: Good triumphs over Evil"
        );
    }

    #[test]
    fn test_evil_wins() {
        assert_eq!(
            battle_outcome("0 0 0 0 0 0", "0 0 0 0 0 0 10"),
            "Battle Result: Evil eradicates all trace of Good"
        );
    }

    #[test]
    fn test_tie() {
        assert_eq!(
            battle_outcome("1 1 1 1 0 0", "1 1 1 2 0 0 0"),
            "Battle Result: No victor on this battle field"
        );
    }

    #[test]
    fn test_good_narrow_win() {
        assert_eq!(
            battle_outcome("1 1 1 1 1 1", "1 1 1 1 1 0 0"),
            "Battle Result: Good triumphs over Evil"
        );
    }

    #[test]
    fn test_evil_narrow_win() {
        assert_eq!(
            battle_outcome("1 1 1 0 0 0", "0 0 0 1 1 1 1"),
            "Battle Result: Evil eradicates all trace of Good"
        );
    }
}

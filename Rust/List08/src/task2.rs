fn likes(names: Vec<&str>) -> String {
    match names.len() {
        0 => "no one likes this".to_string(),
        1 => format!("{} likes this", names[0]),
        2 => format!("{} and {} like this", names[0], names[1]),
        3 => format!("{}, {} and {} like this", names[0], names[1], names[2]),
        _ => format!(
            "{}, {} and {} others like this",
            names[0],
            names[1],
            names.len() - 2
        ),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_no_one_likes() {
        assert_eq!(likes(vec![]), "no one likes this");
    }

    #[test]
    fn test_one_person_likes() {
        assert_eq!(likes(vec!["Peter"]), "Peter likes this");
    }

    #[test]
    fn test_two_people_likes() {
        assert_eq!(likes(vec!["Jacob", "Alex"]), "Jacob and Alex like this");
    }

    #[test]
    fn test_three_people_likes() {
        assert_eq!(
            likes(vec!["Max", "John", "Mark"]),
            "Max, John and Mark like this"
        );
    }

    #[test]
    fn test_four_people_likes() {
        assert_eq!(
            likes(vec!["Alex", "Jacob", "Mark", "Max"]),
            "Alex, Jacob and 2 others like this"
        );
    }

    #[test]
    fn test_five_people_likes() {
        assert_eq!(
            likes(vec!["Anna", "John", "Peter", "Mary", "Steve"]),
            "Anna, John and 3 others like this"
        );
    }

    #[test]
    fn test_six_people_likes() {
        assert_eq!(
            likes(vec!["Peter", "Paul", "Mary", "John", "Alice", "Bob"]),
            "Peter, Paul and 4 others like this"
        );
    }

    #[test]
    fn test_seven_people_likes() {
        assert_eq!(
            likes(vec![
                "Alice", "Bob", "Charlie", "Dave", "Eve", "Frank", "Grace"
            ]),
            "Alice, Bob and 5 others like this"
        );
    }

    #[test]
    fn test_eight_people_likes() {
        assert_eq!(
            likes(vec![
                "Max", "John", "Anna", "Olivia", "George", "Lucas", "James", "Emma"
            ]),
            "Max, John and 6 others like this"
        );
    }

    #[test]
    fn test_nine_people_likes() {
        assert_eq!(
            likes(vec![
                "John", "Sarah", "Jacob", "Emily", "Tom", "Alice", "Mia", "Henry", "Oliver"
            ]),
            "John, Sarah and 7 others like this"
        );
    }
}

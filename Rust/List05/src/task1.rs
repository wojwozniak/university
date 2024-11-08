fn longest_vowel_chain(s: &str) -> usize {
    let vowels = ['a', 'e', 'i', 'o', 'u'];
    let mut max_length = 0;
    let mut current_length = 0;

    for c in s.chars() {
        if vowels.contains(&c) {
            current_length += 1;
            if current_length > max_length {
                max_length = current_length;
            }
        } else {
            current_length = 0;
        }
    }
    max_length
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_codewars() {
        assert_eq!(longest_vowel_chain("codewars"), 1);
    }

    #[test]
    fn test_beautiful() {
        assert_eq!(longest_vowel_chain("beautiful"), 3);
    }

    #[test]
    fn test_strength() {
        assert_eq!(longest_vowel_chain("strength"), 1);
    }

    #[test]
    fn test_aeiou() {
        assert_eq!(longest_vowel_chain("aeiou"), 5);
    }

    #[test]
    fn test_abcde() {
        assert_eq!(longest_vowel_chain("abcde"), 1);
    }

    #[test]
    fn test_no_vowels() {
        assert_eq!(longest_vowel_chain("zzz"), 0);
    }

    #[test]
    fn test_mixed_vowels() {
        assert_eq!(longest_vowel_chain("hellooaeiou"), 7);
    }

    #[test]
    fn test_single_vowel() {
        assert_eq!(longest_vowel_chain("e"), 1);
    }

    #[test]
    fn test_long_consonants() {
        assert_eq!(longest_vowel_chain("bcdfghjklmnpqrstvwxyz"), 0);
    }

    #[test]
    fn test_long_mixed() {
        assert_eq!(longest_vowel_chain("abccdeeeiiooouuuuaaaiieeoo"), 21);
    }
}

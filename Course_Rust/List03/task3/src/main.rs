use std::collections::HashMap;

// We create decoding and encoding Hashmaps
pub struct Cipher {
    encode_map: HashMap<char, char>,
    decode_map: HashMap<char, char>,
}

impl Cipher {
    // Constructor is O(1) (as strings will be <= 26 length)
    pub fn new(alphabet: &str, key: &str) -> Self {
        let mut encode_map = HashMap::new();
        let mut decode_map = HashMap::new();

        // We cannot directly access chars from string like in C
        // We have to cast it into a vector of chars first
        let alphabet_chars: Vec<char> = alphabet.chars().collect();
        let key_chars: Vec<char> = key.chars().collect();

        // Populate hashmaps
        for i in 0..alphabet_chars.len() {
            encode_map.insert(alphabet_chars[i], key_chars[i]);
            decode_map.insert(key_chars[i], alphabet_chars[i]);
        }

        // Contruct struct
        Cipher {
            encode_map,
            decode_map,
        }
    }

    // Encoding and decoding given message
    // We return char unchanged if it isn't in the hashmap
    pub fn encode(&self, plaintext: &str) -> String {
        plaintext
            .chars()
            .map(|c| *self.encode_map.get(&c).unwrap_or(&c))
            .collect()
    }

    pub fn decode(&self, ciphertext: &str) -> String {
        ciphertext
            .chars()
            .map(|c| *self.decode_map.get(&c).unwrap_or(&c))
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_encode_abc() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.encode("abc"), "eta");
    }

    #[test]
    fn test_encode_xyz() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.encode("xyz"), "qxz");
    }

    #[test]
    fn test_encode_aeiou() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.encode("aeiou"), "eirfg");
    }

    #[test]
    fn test_decode_eta() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.decode("eta"), "abc");
    }

    #[test]
    fn test_decode_qxz() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.decode("qxz"), "xyz");
    }

    #[test]
    fn test_decode_eirfg() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.decode("eirfg"), "aeiou");
    }

    #[test]
    fn test_empty_encode() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.encode(""), "");
    }

    #[test]
    fn test_empty_decode() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.decode(""), "");
    }

    #[test]
    fn test_encode_alphabet() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(
            cipher.encode("abcdefghijklmnopqrstuvwxyz"),
            "etaoinshrdlucmfwypvbgkjqxz"
        );
    }

    #[test]
    fn test_decode_alphabet() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(
            cipher.decode("etaoinshrdlucmfwypvbgkjqxz"),
            "abcdefghijklmnopqrstuvwxyz"
        );
    }

    #[test]
    fn test_encode_repeated() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.encode("aaaaaa"), "eeeeee");
    }

    #[test]
    fn test_decode_repeated() {
        let map1 = "abcdefghijklmnopqrstuvwxyz";
        let map2 = "etaoinshrdlucmfwypvbgkjqxz";
        let cipher = Cipher::new(map1, map2);
        assert_eq!(cipher.decode("eeeeee"), "aaaaaa");
    }
}

// # Task 1 # - string to number
// cd w odpowiednie directory i cargo test

/*
    Funkcja string_to_number
    - przyjmujemy referencję do stringa
    - parsujemy domyślną funkcją parse
    - unwrapujemy by nie zwracać typu Result tylko liczbę
*/
fn string_to_number(s: &str) -> i64 {
    s.parse::<i64>().unwrap_or(-1)
}

/*
    Rozwiązanie minimalne - nie trzeba podawać typu dla parse
    bo Rust to ogarnie z typu funkcji
    Nie trzeba też dawać or -> ale wtedy jak się popsuje to funkcja spanikuje
    ew. można matchować Ok / Err jak w podręczniku
*/
fn string_to_number_minimal(s: &str) -> i64 {
    s.parse().unwrap()
}

// Moduł testowy
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn unit_tests() {
        assert_eq!(string_to_number("2137"), 2137);
        assert_eq!(string_to_number("0"), 0);
        assert_eq!(string_to_number("42"), 42);
        assert_eq!(string_to_number("-2137"), -2137);
        assert_eq!(string_to_number("7312"), 7312);
    }
}

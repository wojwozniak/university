# Zadanie 6 / Lista 7

Przykład takiego programu to:
```ml
let x = 10 in 
    let y = let y = 1 in 
        x in 
            let x = 20 in 
                y
```
Program powinien zwrócić 10 - dalsza część nie powinna zmieniać xa (nie mamy let x = 20 w zewnętrznym scopie i nie edytujemy go)

Problemem jest ryzyko variable capture. Aktualna wersja zapewnia nam, że wyrażenia mają oddzielną obsługę wartości zmiennych, a po zmianie byłoby takie ryzyko.
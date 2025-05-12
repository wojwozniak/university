# Zadanie 2 / Lista 7

Język PAIR z ćwiczeń (czyli język LET wyposażony w pary i typ unit) posiada dostatecznie dużo struktury, żeby zdefiniować listy. Konstruktor `::` możemy symulować przy użyciu pary, a `[]` przy użyciu wartości typu `unit`. 

Niestety, w tej chwili nie mamy sposobu, żeby odróżnić listę pustą od niepustej, co w OCamlu możemy zrobić dopasowaniem wzorca.

Dodaj do języka następujące konstrukcje sprawdzające typy wartości:

- `number? e` — sprawdza, czy wartością wyrażenia `e` jest liczba,
- `boolean? e` — sprawdza, czy wartością wyrażenia `e` jest wartość boolowska,
- `pair? e` — sprawdza, czy wartością wyrażenia `e` jest para,
- `unit? e` — sprawdza, czy wartością wyrażenia `e` jest unit.

Przykładowo, wyrażenie `number? (fst (1+1, false))` powinno obliczyć się do prawdy, a `unit? ((),())` — do fałszu.

## Rozwiązanie

Basic rozszerzenie:
- `parser` dostaje po tokenie i po expr na wyrażenie
- `lexer` po wpis na wyrażenie
- `ast` po wpisie expr
- `main`:

```ml
| NumberP e -> (match eval e with | VInt _ -> VBool true | _ -> VBool false)
```
oraz basic w `subst`
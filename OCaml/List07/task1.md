# Zadanie 1 / Lista 7

Modyfikacja interpretera dla leniwej semantyki operatorów logicznych

Zmodyfikuj interpreter tak, by operatory logiczne działały leniwie. Oznacza to, że jeśli po obliczeniu wartości pierwszego argumentu znamy już odpowiedź, nie obliczamy wartości drugiego argumentu. Przykładowo, wyrażenie `false && 10 / 0` powinno obliczyć się do fałszu.

Jaki związek ma leniwa semantyka z łącznością operatorów `&&` i `||`?

**Wskazówka**: Zadanie to można rozwiązać na dwa sposoby: modyfikując ewaluator albo potraktować operatory logiczne jako lukier syntaktyczny rozwijany do wyrażeń warunkowych.

## Rozwiązanie 

Można wywalić z programu zupełnie AND oraz OR -> zamiast tego obsługujemy to `if-em`. Usuwamy z ast i ewaluatora operatorów main.


Było:
```ml
    | e1 = expr; AND; e2 = expr { Binop(And, e1, e2) }
    | e1 = expr; OR; e2 = expr { Binop(Or, e1, e2) }
```

Mamy teraz:
```ml
    | e1 = expr; AND; e2 = expr { If (e1, e2, Bool false) }
    | e1 = expr; OR; e2 = expr { If (e1, Bool true, e2) }
```
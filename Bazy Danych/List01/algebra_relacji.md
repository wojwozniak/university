# Algebra relacji
Wszystkie operacje algebry relacji są wyrażalne za pomocą operacji $\pi$, $\sigma$, $\rho$, $\times$, $\cup$, $\setminus$, $\Join$.

Wytłumaczenie tych operacji (+ jedna dodatkowa):


## Unarne

### $\pi$ - Rzut (Pi) - SELECT

Operacja rzutu $\pi$ wybiera z relacji $R$ tylko te kolumny, które są wymienione w liście atrybutów $L$. Przykładowo $\pi_{nazwisko}(student)$ wybierze z relacji `Student` tylko kolumnę `nazwisko`.

### $\sigma$ - Selekcja (Sigma) - WHERE

Operacja selekcji $\sigma$ wybiera z relacji $R$ tylko te wiersze, które spełniają warunek $C$. Przykładowo $\sigma_{wiek>20}(student)$ wybierze z relacji `Student` tylko te wiersze, w których wartość kolumny `wiek` jest większa od 20.

### $\rho$ - Przemianowanie (Rho) - AS

Operacja przemianowania $\rho$ zmienia nazwę relacji $R$ na $S$. Przykładowo $\rho_{S}(student)$ zmieni nazwę relacji `Student` na `S`.

### $\times$

Operacja iloczynu kartezjańskiego $\times$ tworzy relację, której kolumny to połączenie kolumn relacji $R$ i $S$, a wiersze to wszystkie możliwe kombinacje wierszy z relacji $R$ i $S$.

### $\cup$


### $\cap$


### $\setminus$

### $\Join$ - Połączenie (Join) - JOIN 

Jest to iloczyn kartezjański z selekcją.

Operacja połączenia $\Join$ łączy dwie relacje $R$ i $S$ na podstawie warunku $C$. Przykładowo $\Join_{student.id=ocena.student_id}(student \times ocena)$ połączy relacje `Student` i `Ocena` na podstawie warunku `student.id=ocena.student_id`.

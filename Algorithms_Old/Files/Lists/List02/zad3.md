# Zadanie 3 / Lista 2

Rozważ wersję problemu wydawania reszty, w której i-ty nominał ma wartość równą i-tej liczbie Fibonacciego (i = 1, 2, ...). 
Podaj algorytm, który wydaje resztę, używając co najwyżej jednej monety każdego nominału. 
Czy taki algorytm może wydać każdą kwotę? 
Czy liczba monet wydana przez Twój algorytm jest zawsze optymalna (tj. minimalna)?

## Idea

Standardowe wydawanie reszty tylko z liczbami Fibbonaciego. Będziemy chcieli też
pokazać że w tym przypadku alg. zachłanny = optymalny i da się wydać każdą kwotę.

- Szukamy największej liczby `Fn` mniejszej od kwoty do wydania
- Odejmujemy ją od kwoty
- Idziemy w dół dopóki nie wydamy całej reszty

## Dowód - jedna moneta danej wartości

Niech `Fn` to największa liczba <= zadanej kwocie.

Załóżmy nie wprost że nasz algorytm może wybrać `Fn` dwa razy. 

`Fn` + `Fn` >= `Fn+1` a `x < Fn+1`. Sprzeczność.

Wiemy że po odjęciu `Fn` `x < Fn-1` - możemy iść tak po kolei dla każdej wartości Fn.

## Dowód - dowolna kwota

- Fakt - nie wydajemy dwóch sąsiednich `Fn` -> powód podobny jak wyżej, 
`Fn-1` + `Fn` = `Fn+1` a x < `Fn+1`

Wiemy więc że:
- Brak duplikatów
- Brak sąsiednich lb. fib.

Rozkład dowolnych liczb z tymi warunkami to `Reprezentacja Zeckendorfa`

## Dowód Zeckendorf - indukcja

### Podstawa indukcji

$F_1$ = 1; $F_2$ = 2; $F_3$ = 3

{1, 2, 3, 4} <- można ułożyć z unikatowych lb. fibbonaciego

### Krok indukcyjny

Załóżmy że każdą liczbę a < n możemy zapisać zgodnie z reprezentacją. 
Pokażmy że da się też dla n.

#### Opcja - n = lb.fib

triv - po prostu lb

#### n != lb.fib

Wtedy zachodzi $F_{i-1}$ < n < $F_i$.

Weźmy x = n - $F_{i-1}$

Z założenia wiemy że x można zapisać w reprezencji.

Z nierówności `n` < $F_i$ wiemy że `x` < $F_i$ - $F_{i-1}$ czyli `x` < $F_{i-2}$

Wynika stąd że `x` w repr. nie zawiera $F_{i-2}$ => także $F_{i-1}$

Możemy więc zapisać `n` jako `x w repr.` + $F_{i-1}$ i mamy repr. dla n

## Dowód - optymalność wyniku

Reprezentacja Zackendorfa jest unikalna = jednoznaczna = nie istnieją dwie różne
dla jednej liczby.

By to udowodnić potrzebny jest lemat

### Lemat - S to zbiór różnych niesąsiednich `Fn` gdzie największa to `Fi` => suma S < `Fi+1`

#### Podstawa indukcji

F1 = 1, F2 = 2, F3 = 3, F4 = 5

F1 < F2; F2 < F3; F3 + F1 < F4

#### Krok indukcyjny
Załóżmy że dla S o najw. elemencie `Fi` S < `Fi+1`

Weźmy S' o najw. el. `Fi+1` i niech S" = S' \ $F_{i+1}$

- Wtedy najw. możliwy el. w S" to $F_{i-1}$ (bo brak sąsiadów)

- Z tezy Suma S" < `F_i`

Z tych dwóch warunków:

Suma S' = Suma S" + $F_{i+1}$ < $F_i$ + $F_{i+1}$ = $F_{i+2}$

### Dowód właściwy (optymalność wyniku)

Nie wprost.

- Weźmy dwa zbiory reprezentacji n - S i T.
- Zbiór Rst = S/T; zbiór Rts = T/S  (czyli oba zbiory nie mają przecięcia S i T)
- Suma Rst = Suma Rts, ponieważ suma S = suma T

#### Opcja: Zbiory R są puste

Oznacza to że zbiory są takie same, czyli S=T - sprzeczność, nie są różne

#### Opcja: nie są puste

FRts, FRst - największe elementy w odpowiednich zbiorach

Rst i Rts nie mają wspólnych elementów -> FRts != FRst

Bez utraty ogólności załóżmy że FRst < FRts

Z lematu suma Rst < FRst+1 i stąd suma Rst < FRts

a suma Rts >= Frts, a miało być suma Rst = suma Rts -> sprzeczność
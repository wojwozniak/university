## Zadanie 2 / Lista 1

Dla każdego z poniższych wyrażeń stwierdź, czy jest poprawnie otypowane,
jeśli tak, to podaj jego typ. Uzasadnij swoją odpowiedź.  


### a) 
```ocaml
"foo" ^ 42;
```
Wyrażenie to nie jest poprawnie otypowane, ponieważ operator `^` jest operatorem konkatenacji dla stringów (a nie jesteśmy w JSie żeby takie rzeczy przechodziły XD). Przez to, że drugim opererandem jest 42 (czyli int), to wyrażenie wywali nam błąd.

Typ: błąd

### b) 
```ocaml
"foo" ^ string_of_int 42;;
```
Poprawnie otypowane. `string_of_int 42` skonwertuje inta na stringa, a `^` pozwoli na konkatenację dwóch stringów.

Typ: string

### c)
```ocaml
1. = 2;;
```
Wyrażenie to nie jest poprawnie otypowane, ponieważ operator `=` (porównanie) pozwala jedynie na porównywanie tych samych typów. W tym przypadku mamy do czynienia z porównaniem inta z floatem.

Typ: błąd

### d)
```ocaml
fun a -> a + 5;;
```
Wyrażenie jest poprawnie otypowane. Dostajemy funkcję przyjmującą inta i zwracającą inta powiększonego o 5. Nie deklarujemy wprost typu, ale chyba sobie sam to dedukuje dzięki operatorowi dodawania.

Typ: int -> int

### e)
```ocaml
fun a -> if a > 5 then a else "foo";;
```

Wyrażenie nie jest poprawnie otypowane, ponieważ w przypadku `else` zwracamy stringa, a w przypadku `then` inta. Przetestowałem - nawet sam if musi zwracać jednolity typ.

Typ: błąd

### f)
```ocaml
fun a b -> if a > 5 then a else b;;
```

Wyrażenie jest poprawnie otypowane. Funkcja przyjmuje dwa argumenty, a i b, i zwraca a jeśli a > 5, w przeciwnym wypadku zwraca b. Typ wyrażenia to `int -> int -> int` - można to zinterpretować jako funkcję przyjmującą inta i zwracającą funkcję przyjmującą inta i zwracającą inta. Nawiasy domyślnie są z prawej strony - `int -> (int -> int)`.

Typ: int -> int -> int

### g)
```ocaml
fun a b ->
  let c = a = b in
  if a > 3 && b = "foo"
  then c
  else false;;
```

let c = a = b - tworzymy zmienną boolowską, wynik porównania `a = b`. Błąd dostajemy przy porównaniu `b = "foo"` - porównywaliśmy a = b, więc "kompilator zakłada" że b jest intem (bo intem jest a w `a > 3`). 

Typ: błąd

### h)
```ocaml
fun a ->
  let f a b = a * a + b * b in
    f (f a a) a;;
```
Definiujemy funkcję a, która ma w swoim ciele zdefiniowaną funkcję f zwracającą sumę kwadratów dwóch liczb. Następnie wywołujemy f z dwoma argumentami - gdzie jednym jest wynik wywołania f z dwoma argumentami a, a drugim a. Wynikiem będzie więc 4a^4 + a^2.

Typ: int -> int

### i)
```ocaml
let f a = a > 2 in
  if 3 > 2 then true else f (f 2);;
```

f zwraca boola, więc f (f 2) jest źle otypowane (próbujemy wsadzić boola w miejsce inta).

Typ: błąd
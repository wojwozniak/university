# Monady

Na razie wstępnie - staram się to zrozumieć, być może czegoś tu jeszcze nie ma

## Bind, option

```ml
type 'a comp = 'a option

let return (v : 'a) : 'a comp =
  Some v

let bind (c : 'a comp) (f : 'a -> 'b comp) : 'b comp =
  match c with
  | Some v -> f v
```

### bind to:
- bind : 'a option -> ('a -> 'b option) -> 'b option
- Można powiedzieć że bind to takie bezpieczne wywołanie funkcji na opcjach
- Przekazuje option i zwraca option -> nie musimy się bać o wyjątek


### let*

```ml
let (let* ) = bind
```

Po prostu skrócona wersja - nie chcemy pisać ciągle let bind
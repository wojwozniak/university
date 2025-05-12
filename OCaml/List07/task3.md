# Zadanie 3 / Lista 7

Dodaj do języka lukier syntaktyczny dla list, podobny do tego w OCamlu.

Przykładowo, wyrażenie `[e1; e2; e3]` powinno rozwijać się w fazie analizy składniowej (parsowania) do wyrażenia `(e1, (e2, (e3, ())))`.

## Rozwiązanie
### `lexer` - dodać do reada - brackety i semicolon
```ml
    | "[" { LBRACK } 
    | "]" { RBRACK } 
    | ";" { SEMI } 
```
### `parser` - Dodać wpis do expression oraz całkiem nowe expr list

```ml
    | LBRACK; es = expr_list; RBRACK { es }

    expr_list: 
        | { Unit } 
        | e = mexpr { Pair (e, Unit) } 
        | e = mexpr; SEMI; es = expr_list { Pair (e, es) } ;
```
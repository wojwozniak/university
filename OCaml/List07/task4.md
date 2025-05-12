# Zadanie 4 / Lista 7

Póki co, nie mamy jeszcze funkcji, a tym bardziej funkcji rekurencyjnych, ale możemy dodać do interpretera konstrukcję eliminującą listy poprzez ich zwijanie z prawej strony (niezbyt wygodny w użyciu odpowiednik funkcji fold_right).

Składnia:

fold e1 with (x, acc) -> e2 and e3

gdzie:

e1, e2 i e3 to wyrażenia,

x i acc to identyfikatory.

Semantyka jest taka sama jak w OCamlowym fold_right (fun x acc -> e2) e1 e3.

Na przykład, sumowanie elementów na liście można zapisać następująco:

fold (1, (10, (100, ()))) with (x, y) -> x + y and 0

## Rozwiązanie

### Ast

```ml
    | Fold of expr * ident * ident * expr * expr
```

### Lexer

```ml
    | "fold" { FOLD } 
    | "and" { ANDKW }
```

### Parser

```ml
%token FOLD 
%token ANDKW
```

oraz `mexpr`:

```ml
| FOLD; e1 = mexpr; WITH; LPAREN; x = IDENT; COMMA; acc = IDENT; RPAREN; ARR; e2 = mexpr; ANDKW; e3 = mexpr { Fold(e1, x, acc, e2, e3) }
```

### Main
subst oraz
```ml
| Fold (e1, x, acc, e2, e3) -> 
    (match eval e1 with 
      | VUnit -> eval e3 
      | VPair (v1, v2) -> 
        e2 
        |> subst x (reify v1) 
        |> subst acc (reify (eval (Fold (reify v2, x, acc, e2, e3)))) 
        |> eval 
      | _ -> failwith "Type error")
```
# Pipeline operator

Operator do chainowania aplikacji funkcji by było czytelniej:

```ml
let x = 5
let result = x |> (fun n -> n + 1) |> (fun n -> n * 2)
```

Wykorzystujemy to w kodzie na przykład w taki sposób, by zaimplementować basic folda.

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

gdzie przypominam, reifikacja to przejście do typowych wbudowanych wartości (a nie naszych np. VBool)
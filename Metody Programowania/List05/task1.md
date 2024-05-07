# Zadanie 1 / Lista 5
Przypomnij sobie definicję funkcji map. 

Następnie pokaż, że dla dowolnych funkcji f i g oraz listy xs zachodzi 

```ocaml
map f (map g xs) ≡ map (fun x -> f (g x)) xs
```

Możesz założyć, że funkcje f i g poprawnie obliczają się do wartości dla dowolnego
argumentu.   

## Rozwiązanie
# Dowód indukcyjny

Chcemy udowodnić że dla dowolnych list xs i ys zachodzi:
```scheme
(length (append xs ys)) = (+ (length xs) (length ys))
```
Dla uproszczenia zapisu zapiszemy tę własność jako P(xs, ys)


i) Dla pustych list xs i ys zachodzi:
```scheme
L = (length (append empty empty)) == (length empty) == 0

P = (+ (length empty) (length empty)) == (+ 0 0) == 0

L===P
```

ii) Załóżmy że dla dowolnych xs, ys zachodzi P(xs, ys). Pokażemy że zachodzi P((cons x xs), ys)
```scheme
L = (length (append (cons x xs) ys)) == 
(length (cons x (append xs ys))) == 
(+ 1 (length (append xs ys)))

P = (+ (length (cons x xs)) (length ys)) == 
(+ (+ 1 (length xs)) (length ys)) == 
(+ 1 (+ (length xs) (length ys)))

L===P
```

iii) Załóżmy że dla dowolnych xs, ys zachodzi P(xs, ys). Pokażemy że zachodzi P((append xs xs2), ys)
```scheme
L = (length (append (append xs xs2) ys)) == 
(length (append xs (append xs2 ys))) == 
(+ (length xs) (length (append xs2 ys)))

P = (+ (length (append xs xs2)) (length ys)) == 
(+ (+ (length xs) (length xs2)) (length ys))

L===P
```

A więc P jest własnością dla dowolnych list xs i ys.
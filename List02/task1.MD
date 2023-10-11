# Zadanie 1     
W poniższych wyrażeniach zlokalizuj wolne i związane wystąpienia zmiennych.     
Które wystąpienia wiążą każde z wystąpień związanych?       

1.

```scheme
(let ([x 3])
    (+ x y))        

x jest związany poprzez let, y niezwiązany (interpreter będzie szukał wartości w scope funkcji)

znaki funkcji niezwiązane     
```


2.

```scheme
(let ([x 1]
        [y (+ x 2)])
    (+ x y))        

po liniach:
1) x związany letem,
2) x nie jest związany (interpreter będzie szukał wartości w scope funkcji)
3) x związany z x z pierwszej linii, y związany z y z drugiej linii

znaki funkcji niezwiązane 
```

3.      

```scheme

(let ([x 1])
    (let ([y (+ x 2)])
        (* x y)))       

obydwa x związane z x z pierwszego leta, y związane z y z drugiego leta

znaki funkcji niezwiązane 
```

4.      

```scheme
(define (f x y)
    (* x y z ))         

x, y związane, z niezwiązany
znaki funkcji niezwiązane
```

5.  

```scheme
(define (f x)
    (define (g y z)
        (* x y z))
(f x x x))

x są niezwiązane, y i z związane, f związane, znaki funkcji niezwiązane
```
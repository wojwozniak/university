# Zadanie 1     
W poniższych wyrażeniach zlokalizuj wolne i związane wystąpienia zmiennych.     
Które wystąpienia wiążą każde z wystąpień związanych?       

1. 
(let ([x 3])
    (+ x y))        

x jest związany poprzez let, y niezwiązany (interpreter będzie szukał wartości w scope funkcji)     


2.      
(let ([x 1]
        [y (+ x 2)])
    (+ x y))        

x związany letem, y związany z x w tym samym lecie      


3.      
(let ([x 1])
    (let ([y (+ x 2)])
        (* x y)))       

x związany pierwszym letem, y drugim


4.      
(define (f x y)
    (* x y z ))         

x, y związane, z niezwiązany


5.  
(define (f x)
    (define (g y z)
        (* x y z))
(f x x x))

x związane w pierwszym define, y,z w drugim
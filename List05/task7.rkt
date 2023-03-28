#lang plait


(define-type Prop
(var [v : String])
(conj [l : Prop] [r : Prop])
(disj [l : Prop] [r : Prop])
(neg [f : Prop]) )

(define prop1
  (var "x"))

(define prop2
  (var "y"))

(define prop3
  (conj prop1 prop2))

(define prop4 (disj prop3 prop1))





; Usuwanie duplikatow
(define (rm-dupl lst)
  (cond [(equal? '() lst) '()]
    [
      (member (first lst) (rest lst))
      (rm-dupl (rest lst))
    ]
    [else 
      (cons (first lst)
        (rm-dupl (rest lst))
      )
    ]
  )
)



; Iteracja
(define (iter x xs)
  (cond 
    [(neg? x) (iter (neg-f x) xs)]
    [(disj? x) (iter (disj-r x) (iter (disj-l x) xs))]
    [(conj? x) (iter (conj-r x) (iter (conj-l x) xs))]
    [(var? x) (append xs (list x))]
  )
)



; Zwracamy wynik
(define (free-vars x)
  (rm-dupl (iter x (list)))
)

(free-vars prop4)











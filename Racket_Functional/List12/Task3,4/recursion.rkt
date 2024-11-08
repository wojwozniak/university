#lang racket

(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

#|
(fact 3)
=>
(if (= 3 0) 1 (* 3 (fact (- 3 1))))
=>
(* 3 (fact (- 3 1)))
=>
(* 3 (fact 2))
=>
(* 3 (if (= 2 0) 1 (* 2 (fact (- 2 1)))))
=>
(* 3 (* 2 (fact (- 2 1))))
=>
(* 3 (* 2 (fact 1)))
=>
(* 3 (* 2 (if (= 1 0) 1 (* 1 (fact (- 1 1))))))
=>
(* 3 (* 2 (* 1 (fact (- 1 1)))))
=>
(* 3 (* 2 (* 1 (fact 0))))
=>
(* 3 (* 2 (* 1 (if (= 0 0) 1 (* 0 (fact (- 0 1)))))))
=>
(* 3 (* 2 (* 1 1)))
=>
6
|#

(define (fact-self n)
  (define (fact f)
    (λ (n)
      (if (= n 0)
          1
          (* n ((f f) (- n 1))))))
  ((fact fact) 5))

#|
(fact-self 3)
=>
((fact fact) 3)
=>
((λ (n) (if (= n 0) 1 (* n ((fact fact) (- n 1))))) 3)
=>
(if (= 3 0) 1 (* 3 ((fact fact) (- 3 1)))))
=>
(* 3 ((fact fact) (- 3 1))))
=>
(* 3 ((λ (n) (if (= n 0) 1 (* n ((fact fact) (- n 1))))) 2))
=>
(* 3 (* 2 * ((fact fact) 1)))
=>
...
=>
6
|#

(define (fact-fix n)
  (define (fix f)
    (let ([w (λ (g) (f (λ (z) ((g g) z))))])
      (w w)))
  (define (fact g)
    (λ (n)
      (if (= n 0)
          1
          (* n (g (- n 1))))))
  ((fix fact) n))

#|
(fact-fix 3)
=>
((fix fact) 3)
=>
((w_fact w_fact) 3)
gdzie w_fact = (λ (g) (fact (λ (z) ((g g) z))))
=>
((fact ((λ (z) ((w_fact w_fact) z))) 3)
=>
((λ (n) (if (= n 0) 1 (* n ((λ (z) ((w_fact w_fact) z)) (- n 1))))) 3)
=>
(if (= 3 0) 1 (* 3 ((λ (z) ((w_fact w_fact) z)) (- 3 1))))
=>
(* 3 ((λ (z) ((w_fact w_fact) z)) (- 3 1)))
=>
(* 3 ((w_fact w_fact) 2))
=>
...
=>
6
|#

(define (fact-state n)
  (let ([fact 'undefined])
    (begin
      (set! fact
            (λ (n) (if (= n 0)
                       1
                       (* n (fact (- n 1))))))
      (fact n))))

#|
< (fact-state 3) | env >

=>

< (begin
    (set! fact
          (λ (n) (if (= n 0)
                     1
                     (* n (fact (- n 1))))))
    (fact 3))

| env' >

gdzie env' = env[fact : 'undefined]

=>

< (begin
    (set! fact v)
    (fact 3))

| env' >

gdzie v = (funV n (if (= n 0) 1 (* n (fact (- n 1)))))) env')

=>

< (fact 3) | env'' >

gdzie env'' = env[fact : v]
      v = (funV n '(if (= n 0) 1 (* n (fact (- n 1)))))) env'') 

=>

< (if (= n 0) 1 (* n (fact (- n 1)))))) | env''[n : 3] >

=>

< (* 3 (fact 2)) | env''[n : 3] >

=>

...

=>

6
|#
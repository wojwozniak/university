#lang racket

(define (sum-bigger x y z)
  (let ((a (max x y)))
  (let ((b (if (= a x) (max y z) (max x z))))
  (+ (* a a) (* b b)))))

(require rackunit)

(define (test-sum-bigger)
  (check-equal? (sum-bigger 3 4 5) 41)
  (check-equal? (sum-bigger 4 3 5) 41)
  (check-equal? (sum-bigger 5 4 3) 41)
  (check-equal? (sum-bigger 1 1 1) 2)
  (check-equal? (sum-bigger 0 0 0) 0)
  (check-equal? (sum-bigger 1 2 3) 13)
  (check-equal? (sum-bigger 5 5 5) 50))
  (check-not-equal? (sum-bigger 2 1 3) 7)

(test-sum-bigger)

;Mamy funkcję sum-bigger przyjmującą trzy argumenty    
;Tworzymy zmienną a (większa z dwóch pierwszych liczb)   
;Następnie b - większa z dwóch pozostałych   
;Zwracamy sumę ich kwadratów   
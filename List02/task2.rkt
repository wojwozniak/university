#lang racket
(require rackunit)

; Rekurencyjnie
(define (fib n)
    (cond [(= n 0) 0]
    [(= n 1) 1]
    [else (+ (fib (- n 1)) (fib (- n 2)))]
  )
)

; Testy wersji rekurencyjnej
(define (test-fib)
  (check-equal? (fib 0) 0)
  (check-equal? (fib 4) 3)
  (check-not-equal? (fib 21) 37)
)
(test-fib)

; Iteracyjnie
(define (fib-iter n)
    (define (it i a b)
        (if (= i n)
            a
            (it (+ i 1) b (+ a b))
        )
    )
    (it 0 0 1)
)

; Testy wersji iteracyjnej
(define (test-fib-iter)
  (check-equal? (fib-iter 0) 0)
  (check-equal? (fib-iter 4) 3)
  (check-not-equal? (fib-iter 21) 37)
)
(test-fib-iter)

; Wersja iteracyjna jest szybsza - ilość wywołań w rekurencyjnej rosnie wykladniczo 2^n
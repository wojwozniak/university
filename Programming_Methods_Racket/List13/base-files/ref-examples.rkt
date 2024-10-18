#lang plait

(module+ test
  (print-only-errors #t))

(define gensym
  (let ([c 0])
    (λ ()
      (begin 
        (set! c (+ c 1))
        c))))

(module+ test
  (test (+ (gensym) (gensym))
        3))

(define x 42)

(define (foo z)
  (begin 
    (set! z (+ z 1))
    z))

(module+ test
  (test (foo x)
        43)
  (test (begin (foo x)
               x)
        42))

;;;;;;;;;;;;;;;;;;;;;

(define gensym-box
  (let ([c (box 0)])
    (λ ()
      (begin 
        (set-box! c (+ (unbox c) 1))
        (unbox c)))))

(module+ test
  (test (+ (gensym-box) (gensym-box))
        3))

(define y (box 42))

(define (bar z)
  (begin 
    (set-box! z (+ (unbox z) 1))
    (unbox z)))

(module+ test
  (test (bar y)
        43)
  (test (begin (bar y)
               (unbox y))
        44))
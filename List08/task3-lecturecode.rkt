#lang racket
(provide
 mqueue?
 nonempty-mqueue?
 (contract-out
   [mqueue-empty? (-> mqueue? boolean?)]
   [make-mqueue   (-> mqueue?)]
   [mqueue-push   (-> mqueue? any/c void?)]
   [mqueue-pop    (-> mqueue? any/c)]
   [mqueue-join   (-> nonempty-mqueue? nonempty-mqueue? void?)])

(struct mqueue
  ([front #:mutable]
   [back  #:mutable]))

(define (mqueue-empty? q)
  (and (null? (mqueue-front q))
       (null? (mqueue-back  q))))

(define (nonempty-mqueue? q)
  (and (mqueue? q) (mpair? (mqueue-front q))))

(define (make-mqueue)
  (mqueue null null))

(define (mqueue-push q x)
  (define p (mcons x null))
  (if (mqueue-empty? q)
      (set-mqueue-front! q p)
      (set-mcdr! (mqueue-back q) p))
  (set-mqueue-back! q p))

(define/contract (mqueue-pop q)
  (-> nonempty-mqueue? any/c)
  (define p (mqueue-front q))
  (set-mqueue-front! q (mcdr p))
  (if (null? (mcdr p))
      (begin
        (set-mqueue-back! q null)
        (mcar p))
      (mcar p)))

(define (mqueue-join q1 q2)
  (set-mcdr! (mqueue-back q1) (mqueue-front q2))
  (set-mqueue-back! q1 (mqueue-back q2))
  (set-mqueue-front! q2 null)
  (set-mqueue-back!  q2 null))
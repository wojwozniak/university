#lang racket

(require data/heap)

(struct sim ([time #:mutable] event-queue))
(struct wire ([value #:mutable] [actions #:mutable] sim))
(struct action (out in1 in2 function))

(provide sim? wire?
  (contract-out
    [make-sim        (-> sim?)]
    [sim-wait!       (-> sim? positive? void?)]
    [sim-time        (-> sim? real?)]
    [sim-add-action! (-> sim? positive? (-> any/c) void?)]

    [make-wire       (-> sim? wire?)]
    [wire-on-change! (-> wire? (-> any/c) void?)]
    [wire-value      (-> wire? boolean?)]
    [wire-set!       (-> wire? boolean? void?)]

    [gate-not  (-> wire? wire? void?)]
    [gate-and  (-> wire? wire? wire? void?)]
    [gate-nand (-> wire? wire? wire? void?)]
    [gate-or   (-> wire? wire? wire? void?)]
    [gate-nor  (-> wire? wire? wire? void?)]
    [gate-xor  (-> wire? wire? wire? void?)]

    [wire-not  (-> wire? wire?)]
    [wire-and  (-> wire? wire? wire?)]
    [wire-nand (-> wire? wire? wire?)]
    [wire-or   (-> wire? wire? wire?)]
    [wire-nor  (-> wire? wire? wire?)]
    [wire-xor  (-> wire? wire? wire?)]

    [bus-value (-> (listof wire?) natural?)]
    [bus-set!  (-> (listof wire?) natural? void?)]

    [flip-flop (-> wire? wire? wire? void?)]
  )
)

; ===================================================================
; ### SIMULATOR ###

(define (make-sim) (sim 0 (make-heap (lambda (a b) (< (car a) (car b))))))

(define (sim-wait! sim ticks)
  (define target (+ (sim-time sim) ticks))
  (define (rec)
    (when (> (heap-count (sim-event-queue sim)) 0)
      (when (<= (car (heap-min (sim-event-queue sim))) target)
        (begin
          (set-sim-time! sim (car (heap-min (sim-event-queue sim))))
          (execute! (cdr (heap-min (sim-event-queue sim))))
          (heap-remove-min! (sim-event-queue sim))
          (rec)
        )
      )
    )
  )
  (rec)
  (set-sim-time! sim target)
)

(define (sim-add-action! sim time action) (heap-add! (sim-event-queue sim) (cons time action)))

; ===================================================================
; ### WIRE FUNCTIONS ###

(define (execute! action)
  (if (null? (action-in2 action))
    (wire-set!
      (action-out action)
      (
        (action-function action) 
        (wire-value (action-in1 action))
      )
    )
    (wire-set!
      (action-out action)
      (
        (action-function action) 
        (wire-value (action-in1 action))
        (wire-value (action-in2 action))
      )
    )
  )
)

(define (call-wire-actions sim list)
  (for-each
    (lambda 
      (action)
      (sim-add-action! 
        sim 
        (+ (sim-time sim) (car action)) 
        (cdr action)
      )
    ) list
  )
)

(define (wire-set! wire value)
  (if (eq? value (wire-value wire))
    (void)
    (begin
      (set-wire-value! wire value)
      (call-wire-actions (wire-sim wire) (wire-actions wire))
    )
  )
)

(define (make-wire sim) (wire #f '() sim))

(define (wire-on-change! wire action)
  (begin 
    (set-wire-actions! 
      wire 
      (cons 
        action
        (wire-actions wire)
      )
    )
    (execute! (cdr action))
  )
)


; ===================================================================
; ### GATES AND WIRES ###
; Values are determined on the output tick - as per assignment

(define (create-gate out in1 in2 function delay)
  (wire-on-change! 
    in1 
    (cons delay (action out in1 in2 function))
  )
  (when (not (null? in2))
    (wire-on-change! 
      in2 (cons delay (action out in1 in2 function))
    )
  )
)

(define (gate-not out in)
  (create-gate out in null not 1)
)

(define (gate-and out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (and x y)) 1)
)

(define (gate-nand out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (not (and x y))) 1)
)

(define (gate-or out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (or x y)) 1)
)

(define (gate-nor out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (not (or x y))) 1)
)

(define (gate-xor out in1 in2)
  (create-gate out in1 in2 (lambda (p q) (not (equal? p q))) 2)
)


(define (wire-not in)
  (define out (make-wire (wire-sim in)))
  (gate-not out in)
  out
)

(define (wire-and in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-and out in1 in2)
  out
)

(define (wire-nand in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-nand out in1 in2)
  out
)

(define (wire-or in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-or out in1 in2)
  out
)

(define (wire-nor in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-nor out in1 in2)
  out
)

(define (wire-xor in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-xor out in1 in2)
  out
)

; ===================================================================
; ### BUS FUNCTIONS ###

(define (bus-set! wires value)
  (match wires
    ['() (void)]
    [(cons w wires)
      (begin
        (wire-set! w (= (modulo value 2) 1))
        (bus-set! wires (quotient value 2))
      )
    ]
  )
)

(define (bus-value ws)
  (foldr 
    (lambda 
      (w value) 
      (+ (if (wire-value w) 1 0) (* 2 value))
    )
    0
    ws
  )
)

(define (flip-flop out clk data)
  (define sim (wire-sim data))
  (define w1  (make-wire sim))
  (define w2  (make-wire sim))
  (define w3  (wire-nand (wire-and w1 clk) w2))
  (gate-nand w1 clk (wire-nand w2 w1))
  (gate-nand w2 w3 data)
  (gate-nand out w1 (wire-nand out w3))
)
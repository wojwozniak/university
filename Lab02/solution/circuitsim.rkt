#lang racket

; Importing data/heap reqiured for event queue
(require data/heap)

; Simulator interface
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





; ### ONLY CODE PROVIDED BY DEFAULT AND TESTS BELOW THIS LINE ###




; ### BUS FUNCTIONS ###


; Bus-set! definition (implementation provided by default)
; Function sets values of all wires in the bus to the given value
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

; bus-value definition (implementation provided by default)
; Function returns the value of the bus
; (i.e. the value of the binary number represented by the bus)
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


; ### Flip-flop ###

; Flip-flop definition (implementation provided by default)
; Function implements a flip-flop with the given clock and data wires
(define (flip-flop out clk data)
  (define sim (wire-sim data))
  (define w1  (make-wire sim))
  (define w2  (make-wire sim))
  (define w3  (wire-nand (wire-and w1 clk) w2))
  (gate-nand w1 clk (wire-nand w2 w1))
  (gate-nand w2 w3 data)
  (gate-nand out w1 (wire-nand out w3))
)


; ### TESTS ###
; Tests for the simulator
; WIP
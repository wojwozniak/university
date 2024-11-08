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

; ===================================================================
; ### SIMULATOR ###

; make-sim
; () => sim
; Function creates a new simulator
; #TODO CODE


; sim-wait!
; sim int+ => void
; Function waits for the given amount of time
; #TODO CODE


; sim-time
; sim => int
; Function returns the current time of the simulator
; #TODO CODE


; sim-add-action
; (sim int+ function) => void
; Function adds a new action to the simulator
; #TODO CODE



; ===================================================================
; ### WIRE ###


; make-wire
; sim => wire
; Function creates a new wire
; #TODO CODE


; wire-on-change!
; wire function => void
; Function adds a new action to the simulator
; #TODO CODE


; wire-value
; wire => boolean
; Function returns the current value of the wire
; #TODO CODE


; wire-set!
; wire boolean => void
; Function sets the value of the wire
; #TODO CODE


; ===================================================================
; ### GATES ###


; gate-not
; wire wire => void
; Function implements a NOT gate
; #TODO CODE


; gate-and
; wire wire wire => void
; Function implements an AND gate
; #TODO CODE


; gate-nand
; wire wire wire => void
; Function implements a NAND gate
; #TODO CODE


; gate-or
; wire wire wire => void
; Function implements an OR gate
; #TODO CODE


; gate-nor
; wire wire wire => void
; Function implements a NOR gate
; #TODO CODE


; gate-xor
; wire wire wire => void
; Function implements an XOR gate
; #TODO CODE


; ===================================================================
; ### WIRES ###


; wire-not
; wire wire => void
; Function implements a NOT gate
; #TODO CODE


; wire-and
; wire wire wire => void
; Function implements an AND gate
; #TODO CODE


; wire-nand
; wire wire wire => void
; Function implements a NAND gate
; #TODO CODE


; wire-or
; wire wire wire => void
; Function implements an OR gate
; #TODO CODE


; wire-nor
; wire wire wire => void
; Function implements a NOR gate
; #TODO CODE


; wire-xor
; wire wire wire => void
; Function implements an XOR gate
; #TODO CODE




; ===================================================================
; ### ONLY CODE PROVIDED BY DEFAULT BELOW THIS LINE ###
; ===================================================================



; ===================================================================
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


; ===================================================================
; ### FLIP-FLOP ###



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
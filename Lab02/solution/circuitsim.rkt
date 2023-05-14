#lang racket

; Importing data/heap reqiured for event queue
(require data/heap)

; Defining structures
(struct sim (current-time event-queue))
(struct wire (val actions))


; It was not explicitly explained in the assignment,
; so I also create action struct to make it easier
; to work with actions
(struct action (time function))
(define (make-action time function) (action time function))


; ===================================================================
; ### CONTRACTS ###

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
; We create current-time variable, event-queue heap and return
; a list of these two variables (so we can access them)
(define (make-sim) (sim 0 (make-heap <=)))


; sim-wait!
; sim int+ => void
; Function runs clock for a given amount of ticks
(define (sim-wait! sim ticks)
  (displayln "")
  ; #TODO CODE
)


; sim-time
; sim => int
; Function returns the current ticks of the simulator
(define (sim-time sim)
  (sim-current-time sim)
)


; sim-add-action!
; (sim int+ function) => void
; Function adds a new action to the simulator
; We also check if the time is positive
(define (sim-add-action! sim time action)
  (cond
    [(<= time 0) (error "Time must be positive")]
    ; head-add! takes a heap and a value and adds it to the heap (and returns void)
    [else 
      (heap-add!
        (sim-event-queue sim) 
        (make-action (+ (sim-current-time sim) time) action)
      )
    ]
  )
)
;#TODO test sim-add-action a bit more



; ===================================================================
; ### WIRE ###


; make-wire
; sim => wire
; Function creates a new wire
(define (make-wire sim)
  (wire #f '())
)


; wire-on-change!
; wire function => void
; Function adds a new action to the wire (fired on value change)
(define (wire-on-change! wire function)
  (displayln "")
  ;#TODO CODE
)


; wire-value
; wire => boolean
; Function returns the current value of the wire
(define (wire-value wire) (wire-val wire))

; wire-set!
; wire boolean => void
; Function updates the value of the wire
(define (wire-set! wire value)
  (displayln "")
  ;#TODO CODE
)


; ===================================================================
; ### GATES ###


; gate-not
; wire wire => void
; Function implements a NOT gate
(define (gate-not in out)
  (displayln "")
  ;#TODO CODE
)


; gate-and
; wire wire wire => void
; Function implements an AND gate
(define (gate-and in1 in2 out)
  (displayln "")
  ;#TODO CODE
)


; gate-nand
; wire wire wire => void
; Function implements a NAND gate
(define (gate-nand in1 in2 out)
  (displayln "")
  ;#TODO CODE
)


; gate-or
; wire wire wire => void
; Function implements an OR gate
(define (gate-or in1 in2 out)
  (displayln "")
  ;#TODO CODE
)


; gate-nor
; wire wire wire => void
; Function implements a NOR gate
(define (gate-nor in1 in2 out)
  (displayln "")
  ;#TODO CODE
)


; gate-xor
; wire wire wire => void
; Function implements an XOR gate
(define (gate-xor in1 in2 out)
  (displayln "")
  ;#TODO CODE
)


; ===================================================================
; ### WIRES ###


; wire-not
; wire => wire
; Function implements a NOT gate
(define (wire-not in)
  (displayln "")
  ;#TODO CODE
)


; wire-and
; wire wire => wire
; Function implements an AND gate
(define (wire-and in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-nand
; wire wire => wire
; Function implements a NAND gate
(define (wire-nand in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-or
; wire wire => wire
; Function implements an OR gate
(define (wire-or in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-nor
; wire wire => wire 
; Function implements a NOR gate
(define (wire-nor in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-xor
; wire wire => wire
; Function implements an XOR gate
(define (wire-xor in1 in2)
  (displayln "")
  ;#TODO CODE
)



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
  (displayln "")
  ;(define sim (wire-sim data))
  ;(define w1  (make-wire sim))
  ;(define w2  (make-wire sim))
  ;(define w3  (wire-nand (wire-and w1 clk) w2))
  ;(gate-nand w1 clk (wire-nand w2 w1))
  ;(gate-nand w2 w3 data)
  ;(gate-nand out w1 (wire-nand out w3))
)
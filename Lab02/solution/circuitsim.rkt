#lang racket

; Importing data/heap reqiured for event queue
(require data/heap)

; Importing trace for debugging
(require racket/trace)

; Defining structures
(struct sim ([current-time #:mutable] [event-queue #:mutable]))
(struct wire ([val #:mutable] [actions #:mutable] [sim]))


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
    [sim-wait!       (-> sim? positive? void?)] ;TODO
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

    [wire-not  (-> wire? wire?)] ;TODO
    [wire-and  (-> wire? wire? wire?)] ;TODO
    [wire-nand (-> wire? wire? wire?)] ;TODO
    [wire-or   (-> wire? wire? wire?)] ;TODO
    [wire-nor  (-> wire? wire? wire?)] ;TODO
    [wire-xor  (-> wire? wire? wire?)] ;TODO

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
; (sim int+) => void
; Function runs clock for a given amount of ticks
(define (sim-wait! sim ticks)
  (displayln "")
  ; #TODO CODE
)


; sim-time
; (sim) => int
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



; ===================================================================
; ### WIRE ###


; Helper call-wire-actions function
(define (call-wire-actions list)
  (if (empty? list)
    (void)
    (begin
      ((car list))
      (call-wire-actions (cdr list))
    )
  )
)


; make-wire
; (sim) => wire
; Function creates a new wire
(define (make-wire sim)
  (wire #f '() sim)
)


; wire-on-change!
; (wire function) => void
; Function adds a new instant-action to the wire (fired on value change)
(define (wire-on-change! wire function)
  (begin 
    (set-wire-actions! wire (cons (wire-actions wire) function))
    (function)
  )
)


; wire-value
; (wire) => boolean
; Function returns the current value of the wire
(define (wire-value wire) (wire-val wire))

; wire-set!
; (wire boolean) => void
; Function updates the value of the wire
(define (wire-set! wire value)
  (if (eq? value (wire-val wire))
    (void)
    (begin
      (set-wire-val! wire value)
      (call-wire-actions (wire-actions wire))
    )
  )
)


; ===================================================================
; ### GATES ###
; Values are determined on the output tick - as per assignment


; gate-not
; (wire wire) => void
; Function implements a NOT gate
; Delay: 1 tick
(define (gate-not out in)
  (define (gate-not-helper)
    (sim-add-action!
      ; sim - get the simulation from the wire
      (wire-sim out)
      ; delay - 1 tick
      1
      ; action - negate the value of the input wire
      (lambda () (wire-set! out (not (wire-value in))))
    )
  )
  ; Call wire-on-change! on the input wire passing helper function
  (wire-on-change! in gate-not-helper)
)


; gate-and
; (wire wire wire) => void
; Function implements an AND gate
; Delay: 1 tick
(define (gate-and out in1 in2)
  (define (gate-and-helper)
    (sim-add-action!
      ; sim - get the simulation from the wire
      (wire-sim out)
      ; delay - 1 tick
      1
      ; action - set the value of the output wire to the AND of the input wires
      (lambda () (wire-set! out (and (wire-value in1) (wire-value in2))))
    )
  )
  ; Call wire-on-change! on the input wires passing helper function
  (wire-on-change! in1 gate-and-helper)
  (wire-on-change! in2 gate-and-helper)
)


; gate-nand
; (wire wire wire) => void
; Function implements a NAND gate
; Delay: 1 tick
(define (gate-nand out in1 in2)
  (define (gate-nand-helper)
    (sim-add-action!
      ; sim - get the simulation from the wire
      (wire-sim out)
      ; delay - 1 tick
      1
      ; action - set the value of the output wire to the NAND of the input wires
      (lambda () (wire-set! out (not (and (wire-value in1) (wire-value in2)))))
    )
  )
  ; Call wire-on-change! on the input wires passing helper function
  (wire-on-change! in1 gate-nand-helper)
  (wire-on-change! in2 gate-nand-helper)
)


; gate-or
; (wire wire wire) => void
; Function implements an OR gate
; Delay: 1 tick
(define (gate-or out in1 in2)
  (define (gate-or-helper)
    (sim-add-action!
      ; sim - get the simulation from the wire
      (wire-sim out)
      ; delay - 1 tick
      1
      ; action - set the value of the output wire to the OR of the input wires
      (lambda () (wire-set! out (or (wire-value in1) (wire-value in2))))
    )
  )
  ; Call wire-on-change! on the input wires passing helper function
  (wire-on-change! in1 gate-or-helper)
  (wire-on-change! in2 gate-or-helper)
)


; gate-nor
; (wire wire wire) => void
; Function implements a NOR gate
; Delay: 1 tick
(define (gate-nor out in1 in2)
  (define (gate-nor-helper)
    (sim-add-action!
      ; sim - get the simulation from the wire
      (wire-sim out)
      ; delay - 1 tick
      1
      ; action - set the value of the output wire to the NOR of the input wires
      (lambda () (wire-set! out (not (or (wire-value in1) (wire-value in2)))))
    )
  )
  ; Call wire-on-change! on the input wires passing helper function
  (wire-on-change! in1 gate-nor-helper)
  (wire-on-change! in2 gate-nor-helper)
)


; gate-xor
; (wire wire wire) => void
; Function implements an XOR gate
; Delay: 2 ticks
(define (gate-xor out in1 in2)
  (define (gate-xor-helper)
    (sim-add-action!
      ; sim - get the simulation from the wire
      (wire-sim out)
      ; delay - 2 ticks
      2
      ; action - set the value of the output wire to the XOR of the input wires
      (lambda () (wire-set! out (xor (wire-value in1) (wire-value in2))))
    )
  )
  ; Call wire-on-change! on the input wires passing helper function
  (wire-on-change! in1 gate-xor-helper)
  (wire-on-change! in2 gate-xor-helper)
)


; ===================================================================
; ### WIRE LOGIC ###
; Values are determined on the output tick - as per assignment
; It's connecting the gates to the wires 
; Function's output is a wire (with a value that would be returned by the gate)


; wire-not
; (wire) => wire
; Function implements a NOT gate
; Delay: 1 tick
(define (wire-not in)
  (displayln "")
  ;#TODO CODE
)


; wire-and
; (wire wire) => wire
; Function implements an AND gate
; Delay: 1 tick
(define (wire-and in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-nand
; (wire wire) => wire
; Function implements a NAND gate
; Delay: 1 tick
(define (wire-nand in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-or
; (wire wire) => wire
; Function implements an OR gate
; Delay: 1 tick
(define (wire-or in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-nor
; (wire wire) => wire 
; Function implements a NOR gate
; Delay: 1 tick
(define (wire-nor in1 in2)
  (displayln "")
  ;#TODO CODE
)


; wire-xor
; (wire wire) => wire
; Function implements an XOR gate
; Delay: 2 ticks
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
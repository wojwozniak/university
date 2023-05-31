#lang racket

; Importing data/heap reqiured for event queue
(require data/heap)

; Importing trace for debugging
(require racket/trace)

; Defining structures
(struct sim ([current-time #:mutable] [event-queue #:mutable]))
(struct wire ([val #:mutable] [actions #:mutable] [sim]))

; I also create action structure for the event queue
(struct action (out in1 in2 function))

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

; Helper comparator function for the event queue
; (list list) => boolean
; Function compares two actions
(define (comparator a b)
  (< (car a) (car b))
)

; make-sim
; () => sim
; Function creates a new simulator
; We create current-time variable, event-queue heap and return
; a list of these two variables (so we can access them)
(define (make-sim) (sim 0 (make-heap comparator)))


; sim-wait!
; (sim int+) => void
; Function runs clock for a given amount of ticks
(define (sim-wait! sim ticks)
  ; Define target time
  (define target (+ (sim-current-time sim) ticks))
  ; Define recursive helper function
  (define (rec)
    ; Check if queue is empty (so we avoid error when checking time in first element when queue is empty)
    (when (> (heap-count (sim-event-queue sim)) 0)
      (when (<= 
            (car (heap-min (sim-event-queue sim))) 
            target)
        (begin
          ; Delete first element from the queue
          (heap-remove-min! (sim-event-queue sim))
          ; Update current time to the time of the action
          (set-sim-current-time! sim (car (heap-min (sim-event-queue sim))))
          ; Execute the action
          (execute! (cdr (heap-min (sim-event-queue sim))))
          ; Call the function again
          (rec)
        )
      )
    )
  )
  ; Call the helper functionss
  (rec)
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
  (heap-add!
    (sim-event-queue sim) 
    (cons time action)
  )
)



; ===================================================================
; ### WIRE ###


; Helper execute! function
; (action) => void
; Function executes the action
(define (execute! action)
  ; Check if second input is null
  (if (null? (action-in2 action))
    ; If it is, we call the function with only one input
    (wire-set!
      (action-out action)
      (
        (action-function action) 
        (wire-value (action-in1 action))
      )
    )
    ; If it is not, we call the function with two inputs
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

; Helper call-wire-actions function
; (sim list) => void
; Function calls all actions in the lists
(define (call-wire-actions sim list)
  (for-each
    (lambda 
      (action)
      (sim-add-action! 
        sim 
        (+ sim-time (car action)) 
        (cdr action)
      )
    ) list
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
    (set-wire-actions! 
      wire 
      (cons 
        function
        (wire-actions wire)
      )
    )
    (display (wire-actions wire))
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
      (call-wire-actions (wire-sim wire) (wire-actions wire))
    )
  )
)


; ===================================================================
; ### GATES ###
; Values are determined on the output tick - as per assignment


; To simplify the code, I decided to implement  create-gate function

; create-gate
; (wire wire wire function int+) => void
; Helper function generating new gate
; Takes 5 argumengts: output wire, input wire 1, input wire 2, function and delay
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

; gate-not
; (wire wire) => void
; Function implements a NOT gate
; Delay: 1 tick
(define (gate-not out in)
  (create-gate out in null not 1)
)


; gate-and
; (wire wire wire) => void
; Function implements an AND gate
; Delay: 1 tick
(define (gate-and out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (and x y)) 1)
)


; gate-nand
; (wire wire wire) => void
; Function implements a NAND gate
; Delay: 1 tick
(define (gate-nand out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (not (and x y))) 1)
)


; gate-or
; (wire wire wire) => void
; Function implements an OR gate
; Delay: 1 tick
(define (gate-or out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (or x y)) 1)
)


; gate-nor
; (wire wire wire) => void
; Function implements a NOR gate
; Delay: 1 tick
(define (gate-nor out in1 in2)
  (create-gate out in1 in2 (lambda (x y) (not (or x y))) 1)
)


; gate-xor
; (wire wire wire) => void
; Function implements an XOR gate
; Delay: 2 ticks
(define (gate-xor out in1 in2)
  (create-gate out in1 in2 (lambda (p q) (not (equal? p q))) 2)
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
  (define out (make-wire (wire-sim in)))
  (gate-not out in)
  out
)


; wire-and
; (wire wire) => wire
; Function implements an AND gate
; Delay: 1 tick
(define (wire-and in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-and out in1 in2)
  out
)


; wire-nand
; (wire wire) => wire
; Function implements a NAND gate
; Delay: 1 tick
(define (wire-nand in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-nand out in1 in2)
  out
)


; wire-or
; (wire wire) => wire
; Function implements an OR gate
; Delay: 1 tick
(define (wire-or in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-or out in1 in2)
  out
)


; wire-nor
; (wire wire) => wire 
; Function implements a NOR gate
; Delay: 1 tick
(define (wire-nor in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-nor out in1 in2)
  out
)


; wire-xor
; (wire wire) => wire
; Function implements an XOR gate
; Delay: 2 ticks
(define (wire-xor in1 in2)
  (define out (make-wire (wire-sim in1)))
  (gate-xor out in1 in2)
  out
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
  (define sim (wire-sim data))
  (define w1  (make-wire sim))
  (define w2  (make-wire sim))
  (define w3  (wire-nand (wire-and w1 clk) w2))
  (gate-nand w1 clk (wire-nand w2 w1))
  (gate-nand w2 w3 data)
  (gate-nand out w1 (wire-nand out w3))
)
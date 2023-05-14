#lang racket

; Importing data/heap reqiured for event queue
(require data/heap)

; Defining structures
(struct sim (current-time event-queue))
(struct wire (value actions))

; Simulator interface
(provide sim? wire?
  (contract-out
    [make-sim        (-> sim?)]
    ;[sim-wait!       (-> sim? positive? void?)]
    [sim-time        (-> sim? real?)]
    ;[sim-add-action! (-> sim? positive? (-> any/c) void?)]

    [make-wire       (-> sim? wire?)]
    ;[wire-on-change! (-> wire? (-> any/c) void?)]
    ;[wire-value      (-> wire? boolean?)]
    ;[wire-set!       (-> wire? boolean? void?)]

    ;[gate-not  (-> wire? wire? void?)]
    ;[gate-and  (-> wire? wire? wire? void?)]
    ;[gate-nand (-> wire? wire? wire? void?)]
    ;[gate-or   (-> wire? wire? wire? void?)]
    ;[gate-nor  (-> wire? wire? wire? void?)]
    ;[gate-xor  (-> wire? wire? wire? void?)]

    ;[wire-not  (-> wire? wire?)]
    ;[wire-and  (-> wire? wire? wire?)]
    ;[wire-nand (-> wire? wire? wire?)]
    ;[wire-or   (-> wire? wire? wire?)]
    ;[wire-nor  (-> wire? wire? wire?)]
    ;[wire-xor  (-> wire? wire? wire?)]

    ;[bus-value (-> (listof wire?) natural?)]
    ;[bus-set!  (-> (listof wire?) natural? void?)]

    ;[flip-flop (-> wire? wire? wire? void?)]
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
; Function waits for the given amount of time
; #TODO CODE


; sim-time
; sim => int
; Function returns the current time of the simulator
(define (sim-time sim)
  (sim-current-time sim)
)


; sim-add-action
; (sim int+ function) => void
; Function adds a new action to the simulator
; #TODO CODE



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
; This is a test file for solution.rkt
#lang racket
(require "solution.rkt")



; === Testing ===

; =================
; make-sim
(define a (make-sim))
; Defined a as a sim - calling a will return the sim
;
;a

; =================
; sim-time
; sim-time is a procedure that takes a sim and returns the current time
; Expected: 0
;(sim-time a)

; =================
; sim-add-action!
; sim-add-action! is a procedure that takes a sim, time, and an action and adds the action to the sim
;(sim-add-action! a 1 (lambda () (display "Hello World!")))


; =================
; make-wire

; make-wire is a procedure that takes a sim and returns a wire
; Expected: a wire
;(define w (make-wire a))
;w

; =================
; wire-value
; wire-value is a procedure that takes a wire and returns the current value of the wire
; Expected: #f
;(wire-value w)

; =================
; wire-set!
; wire-set! is a procedure that takes a wire and a value and sets the value of the wire to the given value
; Expected: 1
;(wire-set! w 1)
;(wire-value w)

; =================
; wire-on-change!
; wire-on-change! is a procedure that takes a wire and an action and adds the action to the wire
;(wire-on-change! w (lambda () (display "Hello World!")))

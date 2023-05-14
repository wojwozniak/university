; This is a test file for circuitsim.rkt
#lang racket
(require "circuitsim.rkt")



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
; make-wire

; make-wire is a procedure that takes a sim and returns a wire
; Expected: a wire
;(define w (make-wire a))
;w
#lang racket


sexp -> solo_symbol | start_list | ; Start
sexp2 -> atom | nested_list | ; Dalsze wyrażenia

atom -> symbol | number | boolean ; atom

digit -> | 0 | 1 | ... | 9 ; cyfra
boolean -> #f | #t | ; wartości logiczne
valid_char -> a | ... | z | A ... | Z | ! | / | @ | $ | % | ^ | & | - | + | . ; znaki specjalne

number -> digit+ ; liczba

symbol -> . symbol | valid_char symbol | valid_char | number symbol | symbol number | ;symbol w liscie
solo_symbol -> ' symbol | ` symbol | ;solo_symbol to symbol nie bedacy w liscie


start_list -> '(sexp2*) | '(sexp2+ . sexp2) | `(sexp2*) | `(sexp2+ . sexp2) | ;lista poczatkowa, z ' lub ` na poczatku
nested_list -> (sexp2*) |  (sexp2+ . sexp2) | ; zwykla lista
#lang racket

; Słownik (mapa) kodu Morse'a
(define morse-map
  (hash
    #\a "._"
    #\b "_..."
    #\c "_._."
    #\d "_.."
    #\e "."
    #\f ".._."
    #\g "__."
    #\h "...."
    #\i ".."
    #\j ".___"
    #\k "_._"
    #\l "._.."
    #\m "__"
    #\n "_."
    #\o "___"
    #\p ".__."
    #\q "__._"
    #\r "._."
    #\s "..."
    #\t "_"
    #\u ".._"
    #\v "..._"
    #\w ".__"
    #\x "_.._"
    #\y "_.__"
    #\z "__.."
    #\A "._"
    #\B "_..."
    #\C "_._."
    #\D "_.."
    #\E "."
    #\F ".._."
    #\G "__."
    #\H "...."
    #\I ".."
    #\J ".___"
    #\K "_._"
    #\L "._.."
    #\M "__"
    #\N "_."
    #\O "___"
    #\P ".__."
    #\Q "__._"
    #\R "._."
    #\S "..."
    #\T "_"
    #\U ".._"
    #\V "..._"
    #\W ".__"
    #\X "_.._"
    #\Y "_.__"
    #\Z "__.."
    #\0 "_____"
    #\1 ".____"
    #\2 "..___"
    #\3 "...__"
    #\4 "...._"
    #\5 "....." 
    #\6 "_...."
    #\7 "__..."
    #\8 "___.."
    #\9 "____."
    #\. ".-.-.-"
    #\_ "__..__"
    #\space " "
  )
)

; Definicja funkcji morse code
(define (morse-code input_str)
  ; Przekształcenie stringa na listę znaków
  (define char_list (string->list input_str))

  ; Wewnętrzna funkcja pomocnicza - przekształca listę na listę znaków oddzielonych spacjami
  (define (normalize char_list prev_spaces)
    (match char_list
      ['() '()]
      [(cons (? char-whitespace?) rest)
        (if 
          (= 0 prev_spaces)
          (cons #\space (normalize rest (+ prev_spaces 1)))
          (normalize rest (+ prev_spaces 1))
        )
      ]
      [(cons first rest) 
        (cons first (cons #\space (normalize rest 0)))
      ]
    )
  )
  (define normalized_char_list (normalize char_list 0))

  ; Przekształcenie listy znaków na listę kodów Morse'a
  (define morse_result_list (map (lambda(x) (hash-ref morse-map x)) normalized_char_list))

  ; Złączenie listy kodów Morse'a w jeden string
  (string-join morse_result_list "")
)


; Test
(define str "Mp 22")
(morse-code str)
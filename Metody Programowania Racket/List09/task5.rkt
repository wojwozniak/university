#lang racket

; Słownik z morsea na znaki
(define morse-map-rev
  (hash
    "._" #\a
    "_..." #\b
    "_._." #\c
    "_.." #\d
    "." #\e 
    ".._." #\f
    "__." #\g
    "...." #\h
    ".." #\i
    ".___" #\j
    "_._" #\k
    "._.." #\l
    "__" #\m
    "_." #\n
    "___" #\o
    ".__." #\p
    "__._" #\q
    "._." #\r
    "..." #\s
    "_" #\t
    ".._" #\u
    "..._" #\v
    ".__" #\w
    "_.._" #\x
    "_.__" #\y
    "__.." #\z
     "._" #\A
    "_..." #\B
    "_._." #\C
    "_.." #\D
    "." #\E
    ".._." #\F
    "__." #\G
    "...." #\H
    ".." #\I
    ".___" #\J
    "_._" #\K
    "._.." #\L
    "__" #\M
    "_." #\N
    "___" #\O
    ".__." #\P
    "__._" #\Q
    "._." #\R
    "..." #\S
    "_" #\T
    ".._" #\U
    "..._" #\V
    ".__" #\W
    "_.._" #\X
    "_.__" #\Y
    "__.." #\Z
    "_____" #\0
    ".____" #\1
    "..___" #\2
    "...__" #\3
    "...._" #\4
    "....." #\5
    "_...." #\6
    "__..." #\7
    "___.." #\8
    "____." #\9
    "." #\.
    "_" #\_
  )
)


; Funkcja morse decode (przyjmujemy napis w kodzie morse'a (string))
(define (morse-decode str)

  ; Zamieniamy string na liste charów
  (define char_list (string->list str))

  ; Funkcja pomocnicza - dzieli odpowiednio liste charów na liste stringów (pojedyncze znaki w kodzie morse'a)
  (define (get_morse_str_list char_list morse_bufor)
    (match char_list
      ['() 
        (cons (list->string (reverse morse_bufor)) null)
      ]
      [(cons #\space rest) 
        (cons 
          (list->string (reverse morse_bufor)) 
          (get_morse_str_list rest '())
        )
      ]
      [(cons first rest) 
        (get_morse_str_list rest (cons first morse_bufor))
      ]
    )
  )
  (define morse_string_list (get_morse_str_list char_list '()))


  ; Funkcja poomocnicza "tłumacząca" liste stringów w kodzie morse'a na liste charów (znaki)
  (define (get_result_list xs)
    (match xs
      ['() '()]
      [(cons "" rest) (cons #\space (get_result_list rest))]
      [(cons first rest) 
        (cons 
          (hash-ref morse-map-rev first) 
          (get_result_list rest)
        )
      ]
    )
  )
  (define result_list (get_result_list morse_string_list))

  ; Na koniec przekształcamy liste charów na string
  (list->string result_list)
)



; Testy

(define str "__ .__.  ..___ ..___")
(morse-decode str)
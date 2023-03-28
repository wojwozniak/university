#lang racket

; #TODO Wstaw domyślne struktury

; Definicja column-info
(define-struct column-info (name type) #:transparent)

; Definicja table
(define-struct table (schema rows) #:transparent)

; Tabela cities
(define cities
  (table
    (list 
      (column-info 'city    'string)
      (column-info 'country 'string)
      (column-info 'area    'number)
      (column-info 'capital 'boolean)
    )
    (list 
      (list "Wrocław" "Poland"  293 #f)
      (list "Warsaw"  "Poland"  517 #t)
      (list "Poznań"  "Poland"  262 #f)
      (list "Berlin"  "Germany" 892 #t)
      (list "Munich"  "Germany" 310 #f)
      (list "Paris"   "France"  105 #t)
      (list "Rennes"  "France"   50 #f)
    )
  )
)

; Tabela countries
(define countries
  (table
    (list 
      (column-info 'country 'string)
      (column-info 'population 'number)
    )
   (list 
    (list "Poland" 38)
    (list "Germany" 83)
    (list "France" 67)
    (list "Spain" 47))
  )
)

; Definicja tabeli columns
(define (empty-table columns) (table columns '()))

; Funkcja sprawdzająca czy typy kolumn zgadzają się z typami wartości
; a - wartość kolumny, b - column-info-type
(define (compare-types a b)
  (cond
    [(and (string? a) (equal? b 'string)) #t]
    [(and (number? a) (equal? b 'number)) #t]
    [(and (boolean? a) (equal? b 'boolean)) #t]
    [else #f]
  )
)

; Funkcja wstawiająca do tabeli
(define (table-insert row tab)
  ; Schemat tabeli
  (define schema (table-schema tab))
  ; Sprawdzenie czy długość wiersza jest równa tej w schemacie
  (if (not (= (length row) (length schema)))
    (error "Nie zgadza się ilość pól w wierszu!")
    ; Definiujemy funkcję rekurencyjną,
    ; przyjmującą kolumny ze schematu i wartości z wiersza
    ; do wstawienia
    (let rec ((cols schema) (vals row))
      (cond
        ; Jeśli nie ma więcej kolumn i wartości, zwracamy tabelę
        [(and (null? cols) (null? vals)) 
          (table
            (table-schema tab)
            (append (table-rows tab) (list row))
          )
        ]
        ; Jeśli nazwa kolumny zgadza się z nazwą wartości,
        ; wywołujemy rekurencyjne funkcję dla kolejnych wartości
        [
          (compare-types (car vals) (column-info-type (car cols)))
          (rec (cdr cols) (cdr vals))
        ]
        ; Jeśli poprzednie sprawdzenie nie przeszło, zwracamy błąd
        [else
          (error "Nieprawidłowa nazwa wiersza" (car vals))
        ]
      )
    )
  )
)

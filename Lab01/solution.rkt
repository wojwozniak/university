#lang racket

; ### DEFINICJE I STARTOWE DANE ###

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

; ### FUNKCJE ###

; ## Funkcje Pomocnicze ##

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

; Funkcja sprawdzająca czy string str należy do listy lst
(define (is-string-in-list str lst)
  (for/or 
    ([item (in-list lst)])
    (equal? str item)
  )
)


; ## Funkcje główne ##


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

; Projekcja
(define (table-project cols tab)
  ; Tworzymy listę na której zapiszemy,
  ; które wartości chcemy wypisać (ich indeksy).
  ; Dodamy je za pomocą funkcji rec 
  ; (korzystającej z is-string-in-list)
  (define (rec tab numlst i)
    ; Dopóki tab nie jest pusta przechodzimy po niej
    ; i dla każdego elementu wywołujemy funkcję 
    ; is-string-in-list, aktualizujemy iterator i
    ; jeśli wartość jest prawdziwa, dodajemy iterator do listy
    ; Jeśli tab jest pusta, zwracamy listę
    (if
      (equal? tab '())
        numlst
        (if 
          (is-string-in-list (column-info-name (car tab)) cols)
          (rec (cdr tab) (append numlst (list i)) (+ i 1))
          (rec (cdr tab) numlst (+ i 1))
        )
    )
  )
  
  ; Indeksy kolumn do wypisania
  (define indexes (rec (table-schema tab) '() 0))

  ; Funkcja rekurencyjna, która wypisuje wartości z wierszy 
  ; (tylko te, które są w liście indexes)
  (define (map-table list)
    (if
      (equal? list '())
      '()
      (cons
        (map (lambda (x) (list-ref (car list) x)) indexes)
        (map-table (cdr list))
      )
    )
  )

  ; Zwracamy tabelę z wierszami, które mają wartości z indeksów
  (map-table (table-rows tab))
)


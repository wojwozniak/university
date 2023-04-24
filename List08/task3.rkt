#lang racket

(module task3 racket)

; #WIP - problem z mcons, staram się to ogarnąć

; Zadanie 3

; Wzorując się na implementacji kolejek z wykładu 
; zaimplementuj kolejki dwukierunkowe, 
; czyli takie w których można wstawiać i usuwać element zarówno
; z jednej jak i z drugiej strony kolejki. Do implementacji 
; kolejek dwukierunkowych użyj list dwukierunkowych, 
; czyli takich w których każdy węzeł ma wskaźnik na następny i poprzedni węzeł listy.
; Twoja implementacja powinna znajdować się w osobnym module, 
; a eksportowane procedury powinny mieć odpowiednie kontrakty.

; --------------------------------------------

; Kod z wykładu zaadaptowany na potrzeby zadania

; Kontrakty
(provide
    mqueue?
    nonempty-mqueue?
    (contract-out
        [mqueue-empty?  (-> mqueue? boolean?)]
        [make-mqueue    (-> mqueue?)]
        [mqueue-push-front   (-> mqueue? any/c any/c)]
        [mqueue-push-back   (-> mqueue? any/c any/c)]
        [mqueue-pop-front   (-> nonempty-mqueue? any/c)]
        [mqueue-pop-back    (-> nonempty-mqueue? any/c)]
        ; Zostawiamy jednego join - jesteśmy w stanie uzyskać każdą 
        ; kolejność połączenia poprzez wywołanie join z odpowiednią kolejnością argumentów
        [mqueue-join    (-> mqueue? mqueue? void?)]
        [mqueue-print (-> mqueue? void?)]
    )
)


; Definicja kolejki dwukierunkowej
(struct mqueue
    (
        [front #:mutable]
        [back  #:mutable]
    )
)


; Procedura empty? dla kolejki dwukierunkowej
(define (mqueue-empty? q)
    (and 
        (null? (mqueue-front q))
        (null? (mqueue-back  q))
    )
)


; Procedura nonempty? dla kolejki dwukierunkowej
(define (nonempty-mqueue? q)
    (and 
        (mqueue? q) 
        (mpair? (mqueue-front q))
    )
)


; Procedura make dla kolejki dwukierunkowej
(define (make-mqueue)
    (mqueue null null)
)

; Procedura push front dla kolejki dwukierunkowej
; Przyjmuje kolejkę q i element x do wstawienia
(define (mqueue-push-front q x)
    ; Tworzymy nowy węzęł p z wartością x i cdr ustawionym na front kolejki q
    (define p (mcons x (mqueue-front q)))
    ; Ustawiamy car cdra węzła front na p
    (set-mqueue-front! q p)
    ; Jeśli kolejka jest pusta to ustawiamy back na p
    (when (null? (mqueue-back q))
      (set-mqueue-back! q p)
    )
)

; Procedura push back dla kolejki dwukierunkowej
; Działa analogicznie do push front
(define (mqueue-push-back q x)
    (if (null? (mqueue-back q))
        ; Jeśli kolejka jest pusta to wywołujemy push-front
        (mqueue-push-front q x)
        ; w.p.p. tworzymy nowy węzeł p z wartością x i ustawiamy cdr i back na p
        (let ((p (mcons x null)))
            (set-mcdr! (mqueue-back q) p)
            (set-mqueue-back! q p)
        )
    )
)

; Definicja procedury pop front dla kolejki dwukierunkowej
(define (mqueue-pop-front q)
    ; Zapisujemy węzeł front do zmiennej p
    (define p (mqueue-front q))
    (if (null? p)
        ; Kolejka nie może być pusta!
        (error 'mqueue-pop "Error: Pusta kolejka!")
        ; w.p.p.
        (begin
            ; Ustawiamy front na mcdr węzła p
            (set-mqueue-front! q (mcdr p))
            ; Jeśli front q jest pusty to ustawiamy back na null
            (when (null? (mqueue-front q))
                (set-mqueue-back! q null)
            )
            ; Zwracamy wartość węzła p
            (mcar p)
        )
    )
)

; Definicja procedury pop back dla kolejki dwukierunkowej
(define (mqueue-pop-back q)
    (define p (mqueue-back q))
    (cond
        ; Brak elementów - zwróć błąd
        [(null? p) (error "Error!: Pusta kolejka!")]
        ; Jeden element - ustaw front i back na null
        [(eq? p (mqueue-front q)) 
            (set-mqueue-front! q null)
            (set-mqueue-back! q null)
            ; Zwracamy wartość węzła p
            (mcar p)
        ]
        ; Dwa elementy - szukamy przedostatniego węzła
        [else
            ; Pomocnicza funkcja rekurencyjna
            (let rec
                ; Definiujemy curr i next - aktualne car i cdr
                (
                    (curr (mqueue-front q))
                    (next (mcdr (mqueue-front q)))
                )
                (if (eq? next p)
                    ; Jeśli next jest ostatnim elementem to:
                    ; Usuwamy wskaźnik next tego węzła
                    ; Ustawiamy back na ten węzeł
                    ; Zwracamy wartość ostatniego (usuniętego) węzła
                    (begin
                        (set-mcdr! curr null)
                        (set-mqueue-back! q curr)
                        (mcar next)
                    )
                    ; w.p.p. wywołujemy rekurencyjnie rec 
                    (rec next (mcdr next))
                )
            )
        ]
    )
    
)

; Definicja procedury join dla kolejki dwukierunkowej
; Przyjmuje dwie kolejki q1 i q2
(define (mqueue-join q1 q2)
    (cond
        ; Jeśli q2 jest pusta to nic nie robimy
        [(and (mqueue-empty? q1) (mqueue-empty? q2)) (void)]
        [(mqueue-empty? q2) (void)]
        ; Jeśli q1 jest pusta to przepisujemy q2 do q1
        [(mqueue-empty? q1)
            (set-mqueue-front! q1 (mqueue-front q2))
            (set-mqueue-back! q1 (mqueue-back q2))
            (set-mqueue-front! q2 null)
            (set-mqueue-back!  q2 null)
        ]
        ; w.p.p. dopisujemy q2 na koniec q1 i zeruje wskaźniki q2
        [else
            (set-mcdr! (mqueue-back q1) (mqueue-front q2))
            (set-mqueue-back! q1 (mqueue-back q2))
            (set-mqueue-front! q2 null)
            (set-mqueue-back!  q2 null)
        ]
    )
)

; Na potrzeby testów tworzę też funkcję wypisującą kolejkę
(define (mqueue-print q)
    (if (mqueue-empty? q)
        (displayln "Kolejka jest pusta")
        (do 
            ((q q (mqueue-pop-front q)))
            ((mqueue-empty? q))
            (displayln (mqueue-front q))
        )
    )
)
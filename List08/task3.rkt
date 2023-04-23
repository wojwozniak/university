#lang racket

; Zadanie 3

; Wzorując się na implementacji kolejek z wykładu 
; zaimplementuj kolejki dwukierunkowe, 
; czyli takie w których można wstawiać i usuwać element zarówno
; z jednej jak i z drugiej strony kolejki. Do implementacji 
; kolejek dwukierunkowych użyj list dwukierunkowych, 
; czyli takich w których każdy węzeł ma wskaźnik na następny i poprzedni węzeł listy.
; Twoja implementacja powinna znajdować się w osobnym module, 
; a eksportowane procedury powinny mieć odpowiednie kontrakty.


; Kod z wykładu zaadaptowany na potrzeby zadania

; Kontrakty
(provide
    mdqueue?
    nonempty-mdqueue?
    (contract-out
        [mdqueue-empty?  (-> mdqueue? boolean?)]
        [make-mdqueue    (-> mdqueue?)]
        [mdqueue-push-front   (-> nonempty-mdqueue? any/c)]
        [mdqueue-push-back   (-> nonempty-mdqueue? any/c)]
        [mdqueue-pop-front    (-> (or nonempty-mdqueue? mdqueue?) any/c)]
        [mdqueue-pop-back    (-> (or nonempty-mdqueue? mdqueue?) any/c)]
        ; Zostawiamy jednego join - jesteśmy w stanie uzyskać każdą 
        ; kolejność połączenia poprzez wywołanie join z odpowiednią kolejnością argumentów
        [mdqueue-join    (-> nonempty-mdqueue? nonempty-mdqueue? void?)]
    )
)


; Definicja kolejki dwukierunkowej
(struct mdqueue
    (
        [front #:mutable]
        [back  #:mutable]
    )
)


; Procedura empty? dla kolejki dwukierunkowej
(define (mdqueue-empty? q)
    (and 
        (null? (mdqueue-front q))
        (null? (mdqueue-back  q))
    )
)


; Procedura nonempty? dla kolejki dwukierunkowej
(define (nonempty-mdqueue? q)
    (and 
        (mdqueue? q) 
        (mpair? (mdqueue-front q))
    )
)


; Procedura make dla kolejki dwukierunkowej
(define (make-mdqueue)
    (mdqueue null null)
)

; Procedura push front dla kolejki dwukierunkowej
; Przyjmuje kolejkę q i element x do wstawienia
(define (mdqueue-push-front q x)
    ; Tworzymy nowy węzęł p z wartością x i dwoma wskaźnikami
    (define p (mcons x null null))
    (if (mdqueue-empty? q)
        ; Jeśli kolejka jest pusta to ustawiamy front i back na nowy węzeł
        (begin
            (set-mqueue-front! q p)
            (set-mqueue-back! q p)
        )
        ; w.p.p.
        (begin
            ; Ustawiamy cdr węzła p na węzęł front
            (set-mcdr p (mdqueue-front q))
            ; Ustawiamy car dotychczasowego frontu kolejki q na węzeł p
            (set-mcar (mdqueue-front q) p)
            ; Ustawiamy front na węzeł p
            (set-mqueue-front! q p)
        )
    )
)

; Procedura push back dla kolejki dwukierunkowej
; Działa analogicznie do push front
(define (mdqueue-push-back q x)
    (define p (mcons x null null))
    (if (mdqueue-empty? q)
        (begin
            (set-mqueue-front! q p)
            (set-mqueue-back! q p)
        )
        (begin
            (set-mcdr (mdqueue-back q) p)
            (set-mcdr p (mdqueue-back q))
            (set-mqueue-back! q p)
        )
    )
)


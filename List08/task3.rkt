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
    mqueue?
    nonempty-mqueue?
    (contract-out
        [mqueue-empty?  (-> mqueue? boolean?)]
        [make-mqueue    (-> mqueue?)]
        [mqueue-push-front   (-> nonempty-mqueue? any/c)]
        [mqueue-push-back   (-> nonempty-mqueue? any/c)]
        [mqueue-pop-front   (-> mqueue? any/c)]
        [mqueue-pop-back    (-> mqueue? any/c)]
        ; Zostawiamy jednego join - jesteśmy w stanie uzyskać każdą 
        ; kolejność połączenia poprzez wywołanie join z odpowiednią kolejnością argumentów
        [mqueue-join    (-> nonempty-mqueue? nonempty-mqueue? void?)]
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
    ; Tworzymy nowy węzęł p z wartością x i dwoma wskaźnikami
    (define p (mcons x null null))
    (if (mqueue-empty? q)
        ; Jeśli kolejka jest pusta to ustawiamy front i back na nowy węzeł (begin używamy by wykonać kilka poleceń jako jeden blok w if)
        (begin
            (set-mqueue-front! q p)
            (set-mqueue-back! q p)
        )
        ; w.p.p.
        (begin
            ; Ustawiamy cdr węzła p na węzęł front
            (set-mcdr! p (mqueue-front q))
            ; Ustawiamy car dotychczasowego frontu kolejki q na węzeł p
            (set-mcar! (mqueue-front q) p)
            ; Ustawiamy front na węzeł p
            (set-mqueue-front! q p)
        )
    )
)

; Procedura push back dla kolejki dwukierunkowej
; Działa analogicznie do push front
(define (mqueue-push-back q x)
    (define p (mcons x null null))
    (if (mqueue-empty? q)
        (begin
            (set-mqueue-front! q p)
            (set-mqueue-back! q p)
        )
        (begin
            (set-mcdr! (mqueue-back q) p)
            (set-mcdr! p (mqueue-back q))
            (set-mqueue-back! q p)
        )
    )
)

; Definicja procedury pop front dla kolejki dwukierunkowej
(define (mqueue-pop-front q)
    (define p (mqueue-front q))
    (set-mqueue-front! q (mcdr p))
    (if (null? (mcdr p))
        (begin
            (set-mqueue-back! q null)
            (mcar p))
        (begin
            (set-mcar! (mcdr p) null)
            (mcar p))
    )
)

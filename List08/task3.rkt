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
        [mqueue-pop-front   (-> nonempty-mqueue? mqueue?)]
        [mqueue-pop-back    (-> nonempty-mqueue? mqueue?)]
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
    ; Zapisujemy węzeł front do zmiennej p
    (define p (mqueue-front q))
    ; Ustawiamy front kolejki q na cdr węzła front
    (set-mqueue-front! q (mcdr p))
    ; Jeśli to jedyny element w kolejce to jest ona teraz pusta
    (if (null? (mcdr p))
        (begin
            (set-mqueue-back! q null)
            (mcar p)
        )
        ; w.p.p. ustawiamy car cdra węzła front na null
        (begin
            (set-mcar! (mcdr p) null)
            (mcar p)
        )
    )
)

; Definicja procedury pop back dla kolejki dwukierunkowej
; Działa analogicznie do pop front
(define (mqueue-pop-back q)
    (define p (mqueue-back q))
    (set-mqueue-back! q (mcar p))
    (if (null? (mcar p))
        (begin
            (set-mqueue-front! q null)
            (mcdr p)
        )
        (begin
            (set-mcdr! (mcar p) null)
            (mcdr p)
        )
    )
)

; Definicja procedury join dla kolejki dwukierunkowej
; Przyjmuje dwie kolejki q1 i q2
(define (mqueue-join q1 q2)
    ; Jeśli q1 jest pusta to ustawiamy front i back na front i back kolejki q2
    (if (mqueue-empty? q1)
        (begin
            (set-mqueue-front! q1 (mqueue-front q2))
            (set-mqueue-back! q1 (mqueue-back q2))
        )
        ; w.p.p. jeśli q2 jest pusta to nic nie robimy
        (if (mqueue-empty? q2)
            (void)
            ; w.p.p. łączymy kolejki
            (begin
                ; Ustawiamy cdr węzła back kolejki q1 na front kolejki q2
                (set-mcdr! (mqueue-back q1) (mqueue-front q2))
                ; Ustawiamy car węzła front kolejki q2 na back kolejki q1
                (set-mcar! (mqueue-front q2) (mqueue-back q1))
                ; Ustawiamy back kolejki q1 na back kolejki q2
                (set-mqueue-back! q1 (mqueue-back q2))
            )
        )
    )
) 
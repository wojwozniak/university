#lang racket

;Kolejka FIFO (first in, first out) to struktura danych, do której można dodać element „na koniec”, a także podejrzeć i wyjąć element „na początku”. Prosta implementacja kolejki przy pomocy listy może wyglądać tak:
( define empty-queue null ) ; pusta kolejka
( define ( empty ? q ) ( null ? q ) ) ; czy kolejka jest pusta ?
( define ( push-back x q ) ( append q ( list x ) ) ) ; dodaj element na koniec kolejki
( define ( front q ) ( car q ) ) ; podejrzyj element na poczatku kolejki
( define ( pop q ) ( cdr q ) ) ; zdejmij element z przodu kolejki

; Ta implementacja kolejki jest bardzo czytelna, ale ma wielką wadę związaną z użyciem procedury append w implementacji procedury push-back. 
; Lepszą reprezentacją kolejki jest para list: pierwsza to prefiks kolejki, a druga to sufiks w odwróconej kolejności. W ten sposób mamy łatwy dostęp do przodu kolejki (bo reprezentowany jest przez przód listy) i do tyłu kolejki (bo też reprezentowany jest przez przód listy). 
; Dokładniej: pierwszy element kolejki to pierwszy element pierwszej listy, a nowe elementy możemy dokładać poprzez dokładanie ich na przód drugiej listy. 
; Dopiero gdy skończą się elementy na pierwszej liście, zastępujemy ją odwróconą drugą listą. 
; Sformalizuj ten nieformalny opis poprzez lepszą implementację podanego wyżej interfejsu. 
; By zawsze mieć dostęp do pierwszego elementu kolejki, zachowaj nastepujący niezmiennik: pierwsza lista jest pusta tylko wtedy, gdy druga lista jest pusta.


; Definicje moich wersji
    
; Pusta kolejka
( define my-empty-queue ( cons null null ) )

; Czy kolejka jest pusta?
( define ( my-empty? q ) 
    ( and 
        ( null? ( car q ) ) 
        ( null? ( cdr q ) ) 
    ) 
)

; Dodaj element na koniec kolejki
( define ( my-push-back x q )
    ; Sprawdzamy czy pierwsza lista jest pusta
    ( if ( null? ( car q ) )
        ; Jeśli tak, to dodajemy element na poczatek pierwszej listy
        ( cons ( list x ) ( cdr q ) ) 
        ; Jeśli nie, to dodajemy element na poczatek drugiej listy
        ( cons ( car q ) ( cons x ( cdr q ) ) ) 
    ) 
)

; Podejrzyj element na poczatku kolejki
( define ( my-front q ) ( car ( car q ) ) )

; Zdejmij element z przodu kolejki
( define ( my-pop q )
    ; Sprawdzamy czy pierwsza lista jest pusta
    ( if ( null? ( car q ) )
        ; Jeśli tak, to zwracamy drugą listę
        ( cdr q ) 
        ; Jeśli nie, to zwracamy listę z pierwszym elementem usuniętym
        ( cons ( cdr ( car q ) ) ( cdr q ) ) 
    )
)
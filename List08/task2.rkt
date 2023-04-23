#lang racket

; Zadanie 2

; Zdefiniuj procedurę mreverse!, która odwraca listę mutowalną
; „w miejscu”, czyli nie tworzy nowych bloczków mcons-em,
; a odpowiednio przepina wskaźniki.

; Definicja mreverse!:
(define (mreverse! lst)

    ; Wewnętrzna pętla iteracyjna
    ; Przyjmujemy dwa argumenty - prev to już odwrócona część listy, a curr to pozostałe do odwrócenia
    (define (iter prev curr)
        ; Jeśli przeszliśmy całą listę to ją zwracamy
        (if (null? curr)
            prev
            ; w.p.p. przechodzimy po elementach
            (let
                ; Zapisujemy wskaźnik na kolejny element
                ((next (cdr curr)))
                ; Przepinamy wskaźnik cdr aktualnego elementu na poprzedni element
                (set-mcdr! curr prev)
                ; Wywołujemy rekurencyjnie funkcję iter z 
                ; aktualnym elementem jako poprzednim i 
                ; wcześniej zapisanyn kolejnym elementem jako aktualnym
                (iter curr next)
            )
        )
    )

    ; Wywołujemy wewnętrzną pętlę iteracyjną
    (iter '() lst)

    ; Zwracamy odwróconą listę
    lst
)
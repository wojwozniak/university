#lang racket

;; Najpierw odpowiedź na zadane pytanie, czyli 
;; przykład działania kontraktu wraz z informacją, jak polaryzacja
;; wpływa na obarczanie winą za złamanie kontraktu

;; Dobra implementacja foldla wygląda tak:

(define/contract (foldl f x xs)
  (parametric->/c (a b) (-> (-> a b b) b (listof a) b))
  (if (empty? xs)
      x
      (foldl f (f (car xs) x) (cdr xs))))

;; (foldl (λ (x y) (+ 1 y)) 0 '(1 2 3 4)) działa dobrze i mówi, że ta lista ma długość 4

;; po wywołaniu (foldl (λ (y) (+ 1 y)) 0 '(1 2 3 4))
;; dostajemy informację:

; foldl: contract violation
; [...]
;   in: the 1st argument of [...]
;   blaming: [...] użytkownik 

;; czyli został złamany kontrakt na pierwszym argumencie (czyli
;; argumencie "f"), bo podaliśmy mu funkcję o złej arności. Argument
;; "f" występuje na negatywnej pozycji (jak go sobie wyobrazimy
;; w postaci [f x xs -> foldl] to na lewo od strzałki), więc to
;; wina użytkownika.


;; Zamieńmy teraz kolejność parametrów w funkcji f:

(define/contract (foldl-zły f x xs)
  (parametric->/c (a b) (-> (-> a b b) b (listof a) b))
  (if (empty? xs)
      x
      (foldl-zły f (f x (car xs)) (cdr xs))))  

;; próba wywołania (foldl-zły (λ (x y) (+ 1 y)) 0 '(1 2 3 4)) skutkuje złamanym kontraktem

; foldl-zły: broke its own contract
;   promised: a
;   produced: #<b>
;   in: the 1st argument of
;       the 1st argument of

;; bo obiecano przynieść argument w pudełku podpisanym "a", a
;; tymczasem przyszło coś w pudełku podpisanym "b".

;; Okazało się przy tym, że złamanie kontraktu nastąpiło w innym miejscu:
;; w pierwszym argumencie pierwszego argumentu, czyli w pierszym argumencie "f", tym
;; oznaczonym literą "a". Argument "a" występuje na negatywnej pozycji
;; w (-> a b b), ale (-> a b b) występuje na negatywnej pozycji w
;; (-> (-> a b b) b (listof a) b), zatem (to nasze wystąpienie argumentu) "a"
;; występuje na pozytywnej pozycji w  (-> (-> a b b) b (listof a) b).
;; Dlatego za złamanie kontraktu winiony jest autor funkcji foldl-zły, a nie jej użytkownik

;; ----------------------------------prostszy przykład----------------------------------------


;; podobnie jest z prostszymi kontraktami
(define/contract (plus x y z)
  (-> positive? positive? positive? positive?)
  (+ x y z))

;; w kontrakcie (-> positive? positive? positive? positive?)
;; pierwsze trzy wystąpienia "positive?" są na negatywnych pozycjach,
;; a czwarte na pozytywnej

;; wywołanie (plus -1 2 3) to błąd z winy uzytkownika
;; (bo -1 na negatywnej pozycji nie spełnia kontraktu "positive?"

;; a zła implementacja

(define/contract (plus-zły x y z)
  (-> positive? positive? positive? positive?)
  (- x y z))

;; po wywołaniu (plus-zły 1 2 3) daje błąd z winy autora, bo wynik -4
;; na pozytywnej pozycji nie spełnia kontraktu "positive?"


;; ---------------------------koniec odpowiedzi na pytanie-----------------------------------

;; A teraz o tym drugim przykładzie, który spowodował wystawienie grzyba biedakowi pod tablicą
(define/contract (foldl-zły2 f x xs)
  (parametric->/c (a b) (-> (-> a b b) b (listof a) b))
  (if (empty? xs)
      x
      (foldl-zły2 f (f (car xs) x 0) (cdr xs))))

;; po wywołaniu  (foldl-zły2 (λ (x y) (+ 1 y)) 0 '(1 2 3 4)) Racket napisał 
; arity mismatch;
;  the expected number of arguments does not match the given number
;   expected: 2
;   given: 3

;; Grzyb został wystawiony za to, że delikwent pod tablicą nie
;; wiedział na jakiej pozycji został złamany kontrakt.

;; Tymczasem kontrakt nie został złamany. Racket nie wspomina o
;; łamaniu kontraktu.

;; Żeby zrozumieć, dlaczego kontrakt nie został złamany, trzeba
;; wiedzieć, jak kontrakty są zaimplementowane.

;; O ile rozumiem, funkcja binarna "f" owinięta w kontrakt pozostaje
;; funkcją binarną. Jeśli takiej funkcji przekażemy trzy argumenty, to
;; ewaluator nie będzie umiał uruchomić funkcji "f" z powodu złej
;; arności. A skoro nie daje się uruchomić funkcji, to nie daje się
;; też zrobić pierwszej rzeczy podczas uruchamiania, czyli sprawdzić
;; kontraktu. Kontrakt niesprawdzony nie zostaje też złamany.


;; Podobnie jest z prostszym kontraktem dla plusa wyżej, gdzie 
;; wywołanie (plus 1 2) daje bląd arności a nie złamanie kontraktu.



;; A dlaczego ten problem nie wystąpił przy przekazywaniu (poprawnej)
;; funkcji foldl unarnej funkcji (λ (y) (+ 1 y)) ?
;; 
;; Bo po uruchomieniu foldl Racket zaczyna sprawdzenie
;; kontraktu (na tyle, na ile można go sprawdzić na tym etapie),
;; w szczególności sprawdza, czy (λ (y) (+ 1 y)) jest
;; binarną funkcją — a to można zrobić bez jej uruchamiania.

;; Co ciekawe, nasza implementacja kontraktów z wykładu 7 sobie z tym nie radzi.
;; Po dodaniu do pliku "kontrakty.rkt" z wykładu 7 definicji 

;; (define (foldl f x xs)
;;   (if (empty? xs)
;;       x
;;       (foldl f (f (car xs) x) (cdr xs))))

;; (define foldl-contracted
;;   (wrap-contract
;;    (parametric/c (lambda [a b]
;;                    (->/c (->/c a b b) b (list/c a) b)))
;;    foldl))

;; i wywołaniu  (foldl-contracted (lambda (y) (+ 1 y)) 0 '(1 2 3 4))
;; dostajemy błąd arności a nie informację o złamaniu kontraktu

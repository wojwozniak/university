# Zadanie 3
a) (* (+ 2 2) 5)
Git - 20
b) (* (+ 2 2) (5) )
Błąd - (5) nie jest funkcją
c) (*(+(2 2) 5) )
Błąd - (2 2) nie jest funkcją
d) (*(+ 2
2) 5)
Git - 20
e) (5 * 4)
Błąd - w złej kolejności - interpretujemy 5 jako funkcję (a nią nie jest)
f) (5 * (2 + 2) )
Błąd - dwa błędy j.w.
g) ((+ 2 3) )
Błąd - po dodaniu błąd jak w b)
h) +
#<procedure:+> - błąd ?
i) ( define + (* 2 3) )
+
Git - 6
j) (* 2 +)
Git - 12
k) ( define ( five ) 5)
( define four 4)
(Nie dostajemy żadnego outputu, a potem)
 - ( five ) - git: 5
 - four - git: 4
 - five - #<procedure:five>
 - (four) - błąd jak w b)
Ogólnie (five) staje się procedurą nieprzyjmującą argumentów i zwracającą 5, a four stałą=4
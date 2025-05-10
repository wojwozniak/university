# Zadanie 8 / Lista 4

## #TODO Niedokończone

Dwie proste równoległe \( l' \) i \( l'' \) przecięto \( n \) prostymi \( p_1, \ldots, p_n \).  
Punkty przecięcia prostej \( p_i \) z prostymi \( l' \) i \( l'' \) wyznaczają na niej odcinek.  
Niech **Odc** będzie zbiorem tych odcinków.

---

### (a)  
Ułóż algorytm wyznaczający w **Odc** podzbiór **nieprzecinających się odcinków** o **największej mocy** (tzn. największej liczności).

---

### (b)  
Ułóż algorytm wyznaczający **liczbę podzbiorów**, o których mowa w poprzednim punkcie.

### Idea

Mamy dwie proste równoległe, przecinane przez inne proste. Szukamy zbiorów nieprzecinających się -> w a największego, w b ilości takich podzbiorów.

Zauważmy, że możemy zakodować rysunek przedstawiający zadanie jako permutację -> np. pierwsza prosta przecina w 1,1; druga w 2,5 -> permutacja to (1, 5, ...).

Wówczas staje się to zadaniem na Longest Increasing Substring.
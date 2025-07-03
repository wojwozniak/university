# Zadanie 7 / Lista 5

Udowodnij, że $2n-1$ porównań trzeba wykonać, aby scalić dwa ciągi $n$ elementowe w modelu drzew decyzyjnych. Zastosuj grę z adwersarzem, w której adwersarz na początku ogranicza przestrzeń danych tak, by zawierała $2n$ zestawów danych takich by każde porównanie wykonywane przez algorytm eliminowało co najwyżej jeden zestaw. 

## Rozwiązanie

### Idea

Chcemy scalić 2 posortowane ciągi $A = (a_1, a_2, \dots, a_n)$, $B = (b_1, b_2, \dots, b_n)$.

Gdyby nie zwracać uwagi na to, że ciągi są posortowane, mielibyśmy aż $\binom{2n}{n}$ możliwych ułożeń - taka przestrzeń jest jednak zbyt duża, adwersarz pozbyłby się jak największej ilości elementów którą łatwo wykluczyć. Wybierzmy $2n$ takich ciągów, dla których będzie potrzebnych najwięcej porównań.


### Ciągi 

$X_0 = (a_1, b_1, a_2, b_2, \dots, a_n, b_n)$  
$X_1 = (b_1, a_1, a_2, b_2, \dots, a_n, b_n)$  
$X_2 = (a_1, b_2, b_1, a_2, \dots, a_n, b_n)$  
$\vdots$  
$X_{2n-1} = (a_1, b_1, a_2, b_2, \dots, b_n, a_n)$  
($X_k$ to $X_0$ z inwersją $k$ i $k + 1$ elementu)

Teraz wystarczy pokazać, że każde zapytanie eliminuje co najwyżej 1 zestaw. Będzie to oznaczało, że trzeba wykonać przynajmniej $2n - 1$ porównań.

### Pokazanie że działa

Dla zapytania $a_i, b_j$:

- $i < j$, odpowiadamy $a_i < b_j$, co nie eliminuje żadnego zestawu  
- $i = j$, odpowiadamy, że $a_i < b_i$, co eliminuje jedynie $X_{2i-1}$  
- $i = j + 1$, odpowiadamy, że $a_i > b_j$, co eliminuje jedynie $X_{2j}$  
- $i > j + 1$, odpowiadamy, że $a_i > b_j$, co nie eliminuje żadnego zestawu

Są to wszystkie możliwości -> możemy wyeliminować co najwyżej jeden zestaw jednym pytaniem -> trzeba zadać conajmniej $2n-1$ pytań.

Wynika stąd, że trzeba wykonać 2n-1 porównań, by w modelu drzew decyzyjnych scalić dwa posrtowane ciągi.
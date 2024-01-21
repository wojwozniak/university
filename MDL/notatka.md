# Notatka - Matematyka Dyskretna (L)

Debilpack po kolei tematami z list zadań



## 1. Lista

Tu tylko rzeczy z liceum i podstawy - indukcja, kombinatoryka

Przykłady zadań:

<details>
<summary>Liczba funkcji z m-elementowego w n-elementowy zbiór</summary>

<br>

$\frac{n!}{(n-m)!}$

```
Dowód:

Dla pierwszego elementu mamy n możliwości, dla drugiego n-1, trzeciego n-2, aż do n-m+1. Można to uprościć do n! / (n-m)!
```
</details>


### Warunki konieczne i wystarczające

Jeżeli ze zdania $p$ wynika $q$, to $p$ jest warunkiem koniecznym dla $q$, a $q$ warunkiem wystarczającym dla $p$.

Było takie zadanko - trzeba dać warunek dla którego dla drugiego warunku będzie implikacja w obie strony.


## 2. Lista

### Pidgeonhole principle (Dirichlet)

Jeżeli $n$ gołębi ma się zmieścić w $m$ dziurach, gdzie $n > m$, to przynajmniej jedna dziura musi mieć więcej niż jednego gołębia.

<details>
<summary>5 punktów kratowych - środek dwóch z nich jest punktem kratowym</summary>

<br>

Przynajmniej 2 punkty będą miały taką samą parzystość obu współrzędnych 

(P; P), (NP; P), (P; NP), (NP, NP).

(2 wpadną do jednej z tych szulfadek) 

Parzysta + parzysta = parzysta, nieparzysta + nieparzysta = parzysta => środek będzie miał parzyste współrzędne.

</details>
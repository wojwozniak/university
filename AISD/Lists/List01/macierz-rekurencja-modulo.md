# Rozwiązanie ciągu

- $a_0 = 1$
- $a_1 = 2$
- $a_2 = 3$
- $a_n = a_{n-1} + 2a_{n-2} + 3a_{n-3} + n^2$

Zapisać macierz, która pozwoli Ci do obliczenia $a_n \mod (10^9 + 7)$ oraz wektor który należy na tę macierz.

## Rozwiązanie

### Szukamy macierzy takiej że otrzymamy

$$
\begin{pmatrix}
? & ? & ? & ? & ? & ? \\
? & ? & ? & ? & ? & ? \\
? & ? & ? & ? & ? & ? \\
? & ? & ? & ? & ? & ? \\
? & ? & ? & ? & ? & ? \\
? & ? & ? & ? & ? & ?
\end{pmatrix}
\quad
\begin{pmatrix}
a_{n-1} \\
a_{n-2} \\
a_{n-3} \\
n^2 \\
n \\
1
\end{pmatrix}
=
\begin{pmatrix}
a_n \\
a_{n-1} \\
a_{n-2} \\
(n+1)^2 \\
n+1 \\
1
\end{pmatrix}
$$

### Rozwiązaniem jest

(Mnożenie macierzy - jakie elementy musimy wymnożyć by otrzymać odpowiednią wartość)

$$
\begin{pmatrix}
1 & 2 & 3 & 1 & 0 & 0 \\
1 & 0 & 0 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 & 2 & 1 \\
0 & 0 & 0 & 0 & 1 & 1 \\
0 & 0 & 0 & 0 & 0 & 1
\end{pmatrix}
\quad
\begin{pmatrix}
a_{n-1} \\
a_{n-2} \\
a_{n-3} \\
n^2 \\
n \\
1
\end{pmatrix}
=
\begin{pmatrix}
a_n \\
a_{n-1} \\
a_{n-2} \\
(n+1)^2 \\
n+1 \\
1
\end{pmatrix}
$$

### Wykorzystamy tę macierz w taki sposób

(Wektor wyznaczamy dla $n=3$ podstawiając wartości startowe)

$$
M^{n-2} \times \begin{pmatrix}
3 \\
2 \\
1 \\
9 \\
3 \\
1
\end{pmatrix}
=
\begin{pmatrix}
a_n \\
? \\
? \\
? \\
? \\
?
\end{pmatrix}
$$

# Zadanie 6 / Lista 4
Algorytmy, które dla danych podciągów $(x)$ i $(y)$ rozwiązują następujące wersje problemu znajdowania najdłuższego wspólnego podciągu:

- Znajdowanie najdłuższego wspólnego podciągu zawierającego podciąg „aaabb”,
- Znajdowanie najdłuższego wspólnego podciągu nie zawierającego podciągu „aaabb”,
- Znajdowanie najdłuższego wspólnego podciągu zawierającego podsłowo „aaabb”,
- Znajdowanie najdłuższego wspólnego podciągu nie zawierającego podsłowa „aaabb”.

## Idea

Dodajemy trzeci wymiar by w każdym kroku pamiętać co się działo po drodze.


### podciąg aaabb

```py
def lcs_with_aaabb(x, y):
    m, n = len(x), len(y)
    p = "aaabb"
    dp = [[[float('-inf')] * 6 for _ in range(n+1)] for _ in range(m+1)]
    dp[0][0][0] = 0

    for i in range(m+1):
        for j in range(n+1):
            for k in range(6):
                if dp[i][j][k] == float('-inf'):
                    continue
                if i < m:
                    dp[i+1][j][k] = max(dp[i+1][j][k], dp[i][j][k])
                if j < n:
                    dp[i][j+1][k] = max(dp[i][j+1][k], dp[i][j][k])
                if i < m and j < n and x[i] == y[j]:
                    dp[i+1][j+1][k] = max(dp[i+1][j+1][k], dp[i][j][k] + 1)
                    if k < 5 and x[i] == p[k]:
                        dp[i+1][j+1][k+1] = max(dp[i+1]
                                                [j+1][k+1], dp[i][j][k] + 1)

    if dp[m][n][5] == float('-inf'):
        return "Brak"
    return dp[m][n][5]
```

### bez podciągu

Ten sam algorytm co poprzednio, tylko zwracamy maxa ze stanów pośrednich.

### z podsłowem

Ciągle sprawdzamy czy na ostatnich pięciu znalazło się całe słowo. Tu pewnie lekka nieoptymalność, trzeba sprawdzić i zoptymalizować.

```py
def lcs_with_aaabb_subword(x, y):
    m, n = len(x), len(y)
    p = "aaabb"
    dp = [[[float('-inf')] * 2 for _ in range(n+1)] for _ in range(m+1)]
    dp[0][0][0] = 0

    for i in range(m+1):
        for j in range(n+1):
            for k in range(2):
                if dp[i][j][k] == float('-inf'):
                    continue
                if i < m:
                    dp[i+1][j][k] = max(dp[i+1][j][k], dp[i][j][k])
                if j < n:
                    dp[i][j+1][k] = max(dp[i][j+1][k], dp[i][j][k])
                if i < m and j < n and x[i] == y[j]:
                    dp[i+1][j+1][k] = max(dp[i+1][j+1][k], dp[i][j][k] + 1)
                if k == 0 and i >= 5 and j >= 5:
                    if x[i-4:i+1] == p and y[j-4:j+1] == p:
                        dp[i+1][j+1][1] = max(dp[i+1][j+1][1], dp[i-1][j-1][0] + 5)

    if dp[m][n][1] == float('-inf'):
        return "Brak"
    return dp[m][n][1]
```

### bez podsłowa

Analogicznie do b?
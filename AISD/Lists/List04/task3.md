# Zadanie 3 / Lista 4

Superciągiem ciągów X i Y nazywamy każdy taki ciąg Z, że zarówno X, jak i Y są podciągami ciągu Z.
Ułóż algorytm, który dla danych ciągów X i Y znajduje ich najkrótszy superciąg.

## Idea

Podciąg x ciągu y -> wszystkie elementy x są w y, 

Zauważamy że superciąg Z musi zawierać LCS X i Y -> jeśli X i Y muszą być podciągiem Z, to LCS też musi nim być.

Jeśli chcemy stworzyć najkrótszy superciąg, to bierzemy LCS(X, Y) i dokładamy brakujące litery.

## Czemu działa?

### Czy będzie zawierało wszystkie znaki?

Tak. Włączamy wszystkie jakie są

### Czy ma minimalną długość?

len(X) + len(Y) - len(LCS(X, Y)) to minimum, my w oczywisty sposób to minimum osiągamy.


## Rozwiązanie

Znajdujemy największy wspólny podciąg jak na wykładzie. Zmodyfikowana rekonstrukcja tak by uwzględniać pomijane znaki.

```py
def SCS(X, Y):
    m, n = len(X), len(Y)

    dp = [[0] * (n + 1) for _ in range(m + 1)]

    for i in range(m, -1, -1):
        for j in range(n, -1, -1):
            if i == m or j == n:
                dp[i][j] = 0
            elif X[i] == Y[j]:
                dp[i][j] = dp[i+1][j+1] + 1
            else:
                dp[i][j] = max(dp[i+1][j], dp[i][j+1])

    # Wypełniamy tablicę LCS jak normalnie

    # Inna rekonstrukcja -> łącznie ze skipowanymi znakami
    scs = []
    i, j = 0, 0
    while i < m or j < n:
        if i < m and j < n and X[i] == Y[j]:
            # Jeden znak za dwa ciągi
            scs.append(X[i])
            i += 1
            j += 1
        elif i < m and (j >= n or dp[i+1][j] >= dp[i][j+1]):
            # Dołączenie z Xa
            scs.append(X[i])
            i += 1
        else:
            # Z Y
            scs.append(Y[j])
            j += 1

    return ''.join(scs)


X = "ABCDGH"
Y = "AEDFHR"
print(SCS(X, Y))
```
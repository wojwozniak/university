def hirschberg_lcs(X: str, Y: str) -> str:

    # Wyliczanie długości lcs -> spłaszczone do dwóch wierszy
    # Potrzebujemy tylko poprzedniego wiersza -> bo tu chcemy tylko wynik, nie
    # rekonstruujemy ścieżki jak poprzednio
    def lcs_length(X: str, Y: str) -> list:
        m, n = len(X), len(Y)
        curr = [0] * (n + 1)
        for i in range(1, m + 1):
            prev = curr[:]
            for j in range(1, n + 1):
                if X[i - 1] == Y[j - 1]:
                    curr[j] = prev[j - 1] + 1
                else:
                    curr[j] = max(prev[j], curr[j - 1])
        return curr

    # Funkcja rekurencyjna D&C
    def hirschberg(X: str, Y: str) -> str:
        m, n = len(X), len(Y)

        # Base przypadki
        if m == 0 or n == 0:
            return ""
        if m == 1:
            return X if X in Y else ""

        # Dzielimy X na dwie dosyć równe części
        mid = m // 2

        # Lewa strona z Y
        score_left = lcs_length(X[:mid], Y)

        # Prawa strona z Y od tyłu
        score_right = lcs_length(X[mid:][::-1], Y[::-1])[::-1]

        # Znajdujemy miejsce podziału Y maksymalizujący wynik
        # Maksymalizujący -> docinamy Y w taki sposób by dobrze przydzielić części
        # Y Xsowi
        k = 0
        max_score = -1
        for j in range(n + 1):
            if score_left[j] + score_right[j] > max_score:
                max_score = score_left[j] + score_right[j]
                k = j

        # Liczymy osobne części
        left_lcs = hirschberg(X[:mid], Y[:k])
        right_lcs = hirschberg(X[mid:], Y[k:])

        return left_lcs + right_lcs

    return hirschberg(X, Y)


# Test
X = "AGGTAB"
Y = "GXTXAYB"
result = hirschberg_lcs(X, Y)
print(f"LCS: {result}")  # Output: LCS: GTAB

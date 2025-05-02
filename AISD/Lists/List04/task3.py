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

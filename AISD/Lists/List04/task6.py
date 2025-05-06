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


x = "abbbb"
y = "abbbb"
print(lcs_with_aaabb(x, y))

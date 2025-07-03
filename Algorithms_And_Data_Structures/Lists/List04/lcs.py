# Algorytm najdłuższej wspólnej subsekwencji
# Czas O(m*n), miejsce O(n^2) (da się zbić do O(n))

def LCS(str1, str2):
    m, n = len(str1), len(str2)
    dp = [[0] * (n + 1) for _ in range(m + 1)]  # Tablica na stringi, init do 0

    # Iterujemy od tyłu -> zapełniamy od krawędzi do środka
    for i in range(m, -1, -1):
        for j in range(n, -1, -1):
            if i == m or j == n:
                dp[i][j] = 0
            elif str1[i] == str2[j]:
                dp[i][j] = dp[i+1][j+1] + 1
            else:
                dp[i][j] = max(dp[i+1][j], dp[i][j+1])

    # Tablica tu już zapełniona, długość LCS w dp[0][0]

    # Tu robimy rekonstrukcję stringa
    lcs_str = []
    i, j = 0, 0
    while i < m and j < n:
        # Jeśli są równe to są w substringu
        # Jeśli nie to idziemy dalej w odp. stronę
        if str1[i] == str2[j]:
            lcs_str.append(str1[i])
            i += 1
            j += 1
        elif dp[i+1][j] > dp[i][j+1]:
            i += 1
        else:
            j += 1

    return ''.join(lcs_str)


# Test
str1 = "ABCDGH"
str2 = "AEDFHR"
print(LCS(str1, str2))

# Zadanie 5 / Lista 4

Ułóż algorytm, który dla danego drzewa ważonego T = (V, E; c), gdzie c : V → ℕ jest funkcją wagową, znajduje niezależny podzbiór V₀ ⊆ V, którego suma wag wierzchołków jest możliwie największa.

## Idea

Wybieramy losowy wierzchołek jako root. Lecimy od niego -> Wynik to max z:
- wynik dzieci
- wynik 1 + wnuków

Algorytm będzie działał liniowo bo każdy wierzchołek jest sprawdzany tylko 3 razy.

## Algorytm

```py
def max_independent_set(n, edges, weights):
    tree = defaultdict(list)
    for u, v in edges:
        tree[u].append(v)
        tree[v].append(u)

    dp = [[0, 0] for _ in range(n)]

    def dfs(v, parent):
        dp[v][0] = 0
        dp[v][1] = weights[v]
        for u in tree[v]:
            if u == parent:
                continue
            dfs(u, v)
            dp[v][0] += max(dp[u][0], dp[u][1])
            dp[v][1] += dp[u][0]

    dfs(0, -1)
    return max(dp[0][0], dp[0][1])
```
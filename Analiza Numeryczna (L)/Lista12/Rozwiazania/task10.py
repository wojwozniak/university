import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

def romper(f, a, b, m):
    R = np.zeros((m+1, m+1), float) # Macierz Romberga - inicjalizacja
    h = b - a # Długość przedziału
    R[0, 0] = (h / 2) * (f(a) + f(b)) # Wartość pierwszego elementu macierzy - metoda trapezów

    for i in range(1, m+1):
        h /= 2 # Dzielenie przedziału na połowę
        sum = 0 # Suma wartości funkcji w punktach środkowych
        for k in range(1, 2**i, 2):
            sum += f(a + k * h)

        R[i, 0] = 0.5 * R[i-1, 0] + sum * h # Wartość pierwszego elementu w i-tej kolumnie

        for j in range(1, i+1):
            R[i, j] = R[i, j-1] + (R[i, j-1] - R[i-1, j-1]) / (4**j - 1) # Wartość j-tego elementu w i-tej kolumnie

    return R


f = lambda x: 2024*x**8 - 1977*x**4 - 1981
a, b = -3, 2

f_b = lambda x: 1 / (1 + x**2)
a_b, b_b = -3, 3

f_c = lambda x: np.sin(5*x - np.pi/3)
a_c, b_c = -np.pi, np.pi/6


# Wybór podpunktu zadania

#R = romper(f, a, b, 20)
#R = romper(f_b, a_b, b_b, 20)
R = romper(f_c, a_c, b_c, 20)

# Utworzenie heatmapy z macierzy R
plt.figure(figsize=(10, 8))
sns.set_theme()
sns.heatmap(R, annot=True, annot_kws={"size": 5}, fmt=".6f", cmap="viridis")
plt.title("Macierz Romberga")
plt.xlabel("k")
plt.ylabel("m")
plt.show()
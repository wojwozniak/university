import numpy as np
import matplotlib.pyplot as plt
import math

# Funkcja zwracajaca wartość wielomianu
# Działa rekurencyjne - zwracamy wielomian dla pierwszego punktu z listy 
# i rekurencyjnie wywolujemy dla reszty
def p(x, xs):
    if len(xs) == 0:
        return 1
    return (x - xs[0]) * p(x, xs[1:])


# Funkcja zwracajaca n punktów Czebyszewa w przedziale [-1, 1]
def chebyshev(n):
    chebyshev_points = [] 
    for k in range(n):
        cosval = (k * math.pi) / n
        chebyshev_point = math.cos(cosval)
        chebyshev_points.append(chebyshev_point)
        
    return chebyshev_points

# Tworzymy wykresy - 5 wierszy, 4 kolumny
fig, ax = plt.subplots(5, 4)

# Oś x - 1000 punktów w przedziale [-1, 1]
x = np.linspace(-1, 1, 1000)

# Zmienne do generowania wykresów
j = 0 # Numer wiersza
change_i = 0 # Zmienna pomocnicza do zmiany kolumny

# Generujemy wykresy dla n = 4, 5, ..., 20
for i in range(4, 21):
    # Generujemy równoodległe węzły
    xs = np.linspace(-1, 1, i)

    # Wyliczamy i rysujemy wielomian p(x)
    y = [p(xn, xs) for xn in x] # Wyliczamy wartości wielomianu
    ax[j, i - change_i * 4 - 1].set_title(f'n={i}')
    ax[j, i - change_i * 4 - 1].plot(x, y, color="red")
    
    # Wyliczamy i rysujemy wielomian p(x) dla węzłów Czebyszewa
    cheb = [p(xn, chebyshev(i)) for xn in x]
    ax[j, i - change_i * 4 - 1].plot(x, cheb, color="blue")

    # Aktualizujemy zmienne
    if i > 0 and i % 4 == 0:
        j += 1
        change_i += 1

plt.show() # Wyświetlamy wykresy
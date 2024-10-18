# Wykładniki zbieżności
p_r = 3
p_a = 1.02

# Stałe asymptotyczne
c_r = 1.22
c_a = 0.092

# Błędy dla trzeciego wyrazu
E_3_a = 0.000399783
E_3_r = 0.009220859

# Zadana dokładność - 100 cyfr
epsilon = 10**(-100)

# Funkcja wyliczająca błędy dla kolejnych wyrazów ciągu i zwracająca wyraz dla którego błąd jest mniejszy od epsilon

# Wzór na błąd z którego skorzystamy:
# E_(n+1) = c * (E_n)^p

def find_n(p, c, E_n, epsilon):
    n = 3
    while True:
        E_n = c * (E_n)**p
        n += 1
        if E_n < epsilon:
            return n
        
# Wypisanie wyników
print("Dla an")
print("n = ", find_n(p_a, c_a, E_3_a, epsilon))
print("Dla rn")
print("n = ", find_n(p_r, c_r, E_3_r, epsilon))
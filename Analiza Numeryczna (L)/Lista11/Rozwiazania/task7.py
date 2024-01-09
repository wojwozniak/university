import matplotlib.pyplot as plt
from scipy.interpolate import lagrange
import numpy as np
import pandas as pd

# Wczytanie danych z pliku
path = __file__ + "./../punkty.csv"
points = pd.read_csv(path, header=None).values.tolist()
x_points, y_points = zip(*points)


def f(x):
    return (x - 1.2)*(x + 4.7)*(x - 2.3)


# Stałe dla wykresów
x_plot_values = np.linspace(-4, 5, 100)
y_plot_values = f(x_plot_values)


def genChartA():
    # Podpunkt a - wykres f oraz punkty ze zbioru X
    plt.subplot(5, 4, 1)
    plt.title('a) Wykres funkcji f(x)')

    plt.scatter(x_points, y_points, color='red')
    plt.plot(x_plot_values, y_plot_values)


# Podpunkt b - wielomian interpolacyjny
def genChartB():
    plt.subplot(5, 4, 2)
    plt.title('b) Wielomian interpolacyjny')
    lagrange_poly = lagrange(x_points, y_points)
    y_values_interpolated = lagrange_poly(x_plot_values)
    plt.scatter(x_points, y_points, color='red')
    plt.plot(x_plot_values, y_values_interpolated, color='green')


# Podpunkt c - wielomiany optymalne
# Funkcje pomocnicze


# Wielomian optymalny jest postaci:
# w(x) = suma (pk(x) * ak(x))


# Funkcja obliczająca wartość wielomianu optymalnego w punkcie x - jak w zadaniu 6
def eval_at_given_x(x, c_list, d_list, a_list, degree):
    Pk_0 = 1
    Pk_1 = (x - c_list[1]) * Pk_0
    evaluated_optimal = a_list[0] * Pk_0 + a_list[1] * Pk_1

    for k in range(2, degree + 1):
        old_Pk_1 = Pk_1
        Pk_1 = (x - c_list[k]) * Pk_1 - d_list[k] * Pk_0
        Pk_0 = old_Pk_1
        evaluated_optimal += a_list[k] * Pk_1
    return evaluated_optimal


# Obliczenie c_k - w zad. 3 rozpisane
def eval_ck(Pk_minus_1_square_list, sum_Pk_minus_1_square, x_points):
    sum_xP_square = 0  # x * p^2
    for i in range(0, len(Pk_minus_1_square_list)):
        sum_xP_square += x_points[i] * Pk_minus_1_square_list[i]
    return sum_xP_square / sum_Pk_minus_1_square


# Obliczenie d_k - w zad. 3 rozpisane
def eval_dk(suma_Pk_minus_1_square, suma_Pk_minus_2_square):
    return suma_Pk_minus_1_square / suma_Pk_minus_2_square


# Obliczenie a_k - w zad. 6 wzór
def eval_ak(Pk, sum_Pk_square, y_points):
    sum_fPk = 0  # f * Pk
    for i in range(len(y_points)):
        sum_fPk += y_points[i] * Pk[i]
    return sum_fPk / sum_Pk_square


# Główna funkcja generująca wykresy dla wielomianów optymalnych
def genChartsC(x_points, y_points, x_plot_values, degree):
    plt.subplot(5, 4, degree + 1)
    plt.title(f"c) Wielomian optymalny, stopień {degree}")

    Pk_minus_2_list = [1 for x in range(len(x_points))] # Pk-2, aktualnie P0
    sum_Pk_minus_2_square = len(x_points) # suma Pk-2^2 (w tym przypadku P0^2)
    ck_minus_1 = eval_ck(Pk_minus_2_list, sum_Pk_minus_2_square, x_points) # c_k-1 (c1)
    Pk_minus_1_list = [x - ck_minus_1 for x in x_points] # Pk-1 (P1)
    Pk_minus_1_square_list = [p * p for p in Pk_minus_1_list] # Pk-1^2 (P1^2)
    Pk_square = [p * p for p in Pk_minus_1_list] # Pk^2 (P2^2)
    sum_Pk_square = sum(Pk_square) # suma Pk^2 (suma P2^2)
    sum_Pk_minus_1_square = len(x_points) # suma Pk-1^2 (suma P1^2)

    # Listy pomocnicze - wartości początkowe
    c_list = [0, ck_minus_1] # c_k
    d_list = [0, 0] # d_k
    a_list = [eval_ak(Pk_minus_2_list, sum_Pk_minus_2_square, y_points), eval_ak(
        Pk_minus_1_list, sum_Pk_square, y_points)] # a_k

    # Wielomiany Pk - w zad. 3 rozpisane, liczymy iteracyjnie dla k = 2, 3, ..., degree
    for k in range(2, degree + 1):
        sum_Pk_minus_2_square = sum_Pk_minus_1_square # suma Pk-2^2
        sum_Pk_minus_1_square = sum_Pk_square # suma Pk-1^2

        ck = eval_ck(Pk_minus_1_square_list, sum_Pk_minus_1_square, x_points) # c_k
        dk = eval_dk(sum_Pk_minus_1_square, sum_Pk_minus_2_square) # d_k

        old_Pk_minus_1 = Pk_minus_1_list # Pk-1
        Pk_minus_1_list = [(x - ck) * xPk_minus_1 - dk * xPk_minus_2 for xPk_minus_1,
                           xPk_minus_2, x in zip(Pk_minus_1_list, Pk_minus_2_list, x_points)] # Pk-1
        Pk_minus_2_list = old_Pk_minus_1 # Pk-2

        c_list.append(ck) 
        d_list.append(dk)

        Pk_square_list = [p * p for p in Pk_minus_1_list] # Pk^2
        Pk_minus_1_square_list = Pk_square_list # Pk-1^2
        sum_Pk_square = sum(Pk_square_list) # suma Pk^2
        a_list.append(eval_ak(Pk_minus_1_list, sum_Pk_square, y_points)) # a_k

    # Wykres
    plt.plot(x_plot_values, [eval_at_given_x(
        x, c_list, d_list, a_list, degree) for x in x_plot_values])
    plt.scatter(x_points, y_points, color='red')


genChartA()
genChartB()

for degree in range(2, 16):
    genChartsC(x_points, y_points, x_plot_values, degree)

plt.tight_layout()
plt.show()

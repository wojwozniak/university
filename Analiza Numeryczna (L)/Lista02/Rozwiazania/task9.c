#include <stdio.h>
#include <math.h>

double calculate_old(int k) {
    if (k == 1) return 2;
    double k_minus_1 = calculate_old(k - 1);
    double pow2 = pow(2, k-1);
    double ulamek = k_minus_1 / pow2;
    double internalSquareRoot = sqrt(1 - pow(ulamek,2));
    double nawias = 1 - internalSquareRoot;
    double squareRoot = sqrt(2 * nawias);
    return pow2 * squareRoot;
}

double calculate_new(int k) {
    if (k == 1) return 2;
    double k_minus_1 = calculate_new(k - 1);
    double pierwiastek = sqrt(1 - pow((k_minus_1 / pow(2, k - 1)), 2));
    double licznik = k_minus_1 * k_minus_1;
    double mianownik = 1 + pierwiastek;
    double ulamek = licznik / mianownik;
    return sqrt(2 * ulamek);
}

int main() {
    printf("Result_old: %lf\n", calculate_old(30));
    //printf("Result_new: %lf\n", calculate_new(10000));
    return 0;
}

// Result: 3.141593
// Nieważne jak daleko pójdziemy w rekurencji, wynik będzie zawsze taki sam. (dla 1000 git, gdzie wcześniej psuło się już przy 30)
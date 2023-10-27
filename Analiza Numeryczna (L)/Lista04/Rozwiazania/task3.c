#include <stdio.h>
#include <math.h>

double funkcja(double x) {
    return x - 0.49;
}

int main() {
    double a0 = 0;
    double b0 = 1;

    double an = a0; 
    double bn = b0;

    for (int n = 1; n <= 5; n++) {
        double mn = (an + bn) / 2;

        double en = (bn - an) / 2;

        double fn = funkcja(mn);

        double en_abs = fabs(en);

        printf("Krok %d:\n", n);
        printf("an = %lf, bn = %lf, xn = %lf\n", an, bn, mn);
        printf("f(xn) = %lf\n", fn);
        printf("|en| = %lf\n", en_abs);

        if (fn > 0) {
            bn = mn;
        } else {
            an = mn;
        }
    }

    return 0;
}

// Komentarz:
// wszystko zgodnie z oczekiwaniami
#include <stdio.h>
#include <math.h>

double calculate(double x) {
    double result;

    // sqrt( x^14 + 1 )
    double squareRoot = sqrt(pow(x, 14) + 1);

    // (squareRoot - 1) / (x^14)
    result = (squareRoot - 1) / pow(x, 14);

    return 4046 * result;
}

int main() {
    printf("Result: %lf\n", calculate(0.001));
    return 0;
}

// Result: 0.000000
// Wynik nie jest wiarygodny, ponieważ operujemy
// na skrajnie małych liczbach, z powodu 
// dokładności typu double wynik jest zaokrąglany 
// do zera
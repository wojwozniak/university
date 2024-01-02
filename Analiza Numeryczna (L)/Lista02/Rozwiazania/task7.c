#include <stdio.h>
#include <math.h>

double calculate(double x) {
    double result;

    // sqrt( x^14 + 1 )
    double squareRoot = sqrt(pow(x, 14) + 1);
    result = 1 / ( squareRoot + 1 );

    return 4046 * result;
}

int main() {
    printf("Result: %lf\n", calculate(0.001));
    return 0;
}

// Result: 2023.000000
// Jak wcześniej wyliczyliśmy, granica w zerze wynosi 2023. Wynik jest wiarygodny.
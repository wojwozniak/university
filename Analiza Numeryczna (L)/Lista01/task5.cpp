#include <iostream>
#include <cmath>

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
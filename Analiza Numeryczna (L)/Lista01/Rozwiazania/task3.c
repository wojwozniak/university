#include <stdio.h>
#include <math.h>

double calculate(double x) {
    double result;

    // 1 - cos(17x)
    double numerator = 1 - cos(17 * x); 

    // x^2
    double denominator = x * x;

    return 14 * (numerator / denominator);
}

float calculate2(float x) {
    float result;

    // 1 - cos(17x)
    float numerator = 1 - cos(17 * x); 

    // x^2
    float denominator = x * x;

    return 14 * (numerator / denominator);
}

int main() {
    printf("Single float:\n");
    printf("Result i = -11: %f\n", calculate2(pow(10, -11)));
    printf("Result i = -12: %f\n", calculate2(pow(10, -12)));
    printf("Result i = -13: %f\n", calculate2(pow(10, -13)));
    printf("Result i = -14: %f\n", calculate2(pow(10, -14)));
    printf("Result i = -15: %f\n", calculate2(pow(10, -15)));
    printf("Result i = -16: %f\n", calculate2(pow(10, -16)));
    printf("Result i = -17: %f\n", calculate2(pow(10, -17)));
    printf("Result i = -18: %f\n", calculate2(pow(10, -18)));
    printf("Result i = -19: %f\n", calculate2(pow(10, -19)));
    printf("Result i = -20: %f\n", calculate2(pow(10, -20)));

    printf("Double:\n");
    printf("Result i = -11: %lf\n", calculate(pow(10, -11)));
    printf("Result i = -12: %lf\n", calculate(pow(10, -12)));
    printf("Result i = -13: %lf\n", calculate(pow(10, -13)));
    printf("Result i = -14: %lf\n", calculate(pow(10, -14)));
    printf("Result i = -15: %lf\n", calculate(pow(10, -15)));
    printf("Result i = -16: %lf\n", calculate(pow(10, -16)));
    printf("Result i = -17: %lf\n", calculate(pow(10, -17)));
    printf("Result i = -18: %lf\n", calculate(pow(10, -18)));
    printf("Result i = -19: %lf\n", calculate(pow(10, -19)));
    printf("Result i = -20: %lf\n", calculate(pow(10, -20)));
    return 0;
}

// Result: 0.000000
// Wynik nie jest wiarygodny
// Licznik jest skrajnie mały, wypada poza zakres zmiennej float
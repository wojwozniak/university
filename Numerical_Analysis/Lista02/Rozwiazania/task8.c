#include <stdio.h>
#include <math.h>

double calculate(double x) {
    double x_2 = pow(x, 2);
    double x_4 = pow(x, 4);
    double a = 2023;
    double b = 584647 / 2;
    double c = 168962983 / 360;
    return a - b * x_2 + c * x_4;
}

int main() {
    printf("Result: %lf\n", calculate(pow(10, -11)));
    return 0;
}
#include <stdio.h>
#include <math.h>

// x1 liczymy z minusem koniecznie - wytlumaczone w pdf

void calculate_old(double a, double b, double c) {
    double x1;
    double x2;
    // delta
    double delta = pow(b, 2) - (4 * a * c);
    if(delta < 0) {
        printf("Delta is less than 0, no solution\n");
        return;
    }
    double r = sqrt(delta);
    // x1
    x1 = (-b - r) / (2 * a);
    // x2
    x2 = (-b + r) / (2 * a);
    printf("Old result x1: %f\n", x1);
    printf("Old result x2: %f\n", x2);
}

void calculate_new(double a, double b, double c) {
    double x1;
    double x2;
    // delta
    double delta = pow(b, 2) - (4 * a * c);
    if(delta < 0) {
        printf("Delta is less than 0, no solution\n");
        return;
    }
    double r = sqrt(delta);

    // denominator
    double denominator_first = -1 * a * b;
    double denominator_second = a * r;
    double denominator = denominator_first - denominator_second;
    x1 = (-b - r) / (2 * a);
    x2 = c / denominator;
    printf("New result x1: %f\n", x1);
    printf("New result x2: %f\n", x2);
}

int main() {
    for(int i=10; i<30; i++) {
        double x = pow(2, -i);
        calculate_old(x, 1000.0, x);
        calculate_new(x, 1000.0, x);
    }
    return 0;
}
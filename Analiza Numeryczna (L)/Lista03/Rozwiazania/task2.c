#include <stdio.h>
#include <math.h>

// #WIP na razie nie działa

// x1 liczymy z minusem koniecznie - wytlumaczone w pdf

void calculate_old(double a, double b, double c) {
    double x1;
    double x2;
    // delta
    double delta = b * b - 4 * a * c;
    if(delta < 0) {
        printf("Delta is less than 0, no solution\n");
        return;
    }
    // x1
    x1 = (-b - sqrt(delta)) / (2 * a);
    // x2
    x2 = (-b + sqrt(delta)) / (2 * a);
    printf("Old result x1: %f\n", x1);
    printf("Old result x2: %f\n", x2);
}

void calculate_new(double a, double b, double c) {
    double x1;
    double x2;
    // delta
    double delta = b * b - 4 * a * c;
    if(delta < 0) {
        printf("Delta is less than 0, no solution\n");
        return;
    }
    // denominator
    double denominator_first = -1 * a * b;
    double denominator_second = a * sqrt(delta);
    double denominator = denominator_first - denominator_second;
    x1 = (-b - sqrt(delta)) / (2 * a);
    x2 = c / denominator;
    printf("New result x1: %f\n", x1);
    printf("New result x2: %f\n", x2);
}

int main() {
    calculate_old(400, 85818837, 399997);
    calculate_new(400, 85818837, 399997);
    return 0;
}
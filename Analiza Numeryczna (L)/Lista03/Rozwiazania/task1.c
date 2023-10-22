#include <stdio.h>
#include <math.h>


double calculate_a1(double x) {
    double first = x * x * x;
    double under_sqrt = pow(x, 6) + pow(2023, 2);
    double output = first + sqrt(under_sqrt);
    return pow(output, -1);
}

double calculate_a2(double x) {
    double first = x * x * x;
    double under_sqrt = pow(x, 6) + pow(2023, 2);
    double nominator = sqrt(under_sqrt) - first;
    double output = nominator / pow(2023, 2);
}

/*
double calculate_b1(double x) {
    return log2(x) - 2.0;
}

double calculate_b2(double x) {
    double num = x / 4.0;
    return log2(num);
}
*/

double calculate_b1(double x) {
    return log2(x) / log2(5) - 6;
}

double calculate_b2(double x) {
    double num = x / 15625;
    return log2(num) / log(5);
}



int main() {
    //printf("ppkt a test 1 dla x = 0.001: %f\n", calculate_a1(-6200));
    //printf("ppkt a test 2 dla x = 0.001: %f\n", calculate_a2(-6200));
    printf("ppkt b test 1 dla x = 4: %f\n", calculate_b1(15624.9));
    printf("ppkt b test 2 dla x = 4: %f\n", calculate_b2(15624.9));
    return 0;
}
#include <stdio.h>
#include <math.h>

double newton(double a, double x0)
{
    double epsilon = 1e-8;
    double x = x0;
    int max_i = 50;

    for (int i = 0; i < max_i; ++i)
    {
        double xn = x - (x * x - a) / (2 * x);

        if (fabs(xn - x) < epsilon)
        {
            return xn;
        }

        x = xn;
    }
    return x;
}

int main()
{
    double a = 2;
    double result;
    double factor = 1;
    for(int i = 1; i<=30; i++) {
        result = newton(a, i * factor);
        printf("Pierwiastek kwadratowy z %.2lf wynosi okolo %.8lf przy starcie z %d\n", a, result, i * factor);
    }

    return 0;
}
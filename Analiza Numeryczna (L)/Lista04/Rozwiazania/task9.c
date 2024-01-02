#include <stdio.h>
#include <math.h>

// Przykładowa funkcja x^3
double f(double x)
{
    return -x * x * x;
}

// Pochodna funkcji f(x)
double df(double x)
{
    return -3 * x * x;
}

double newton(double x0, double r)
{
    int max_i = 50;
    double epsilon = 1e-8;

    double x = x0;

    for (int i = 0; i < max_i; ++i)
    {
        x = x - r * (f(x)/df(x));
    }

    return x;
}

int main()
{
    double r = 3;
    double x0 = 10;

    double result = newton(x0, r);

    printf("Dla r = %.1f i x0 = %.1f, przybliżenie wynosi %.8f\n", r, x0, result);

    return 0;
}
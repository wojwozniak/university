#include <stdio.h>
#include <math.h>

double calculateApproximation(double x0, double a)
{
    int max_i = 100;
    double epsilon = 1e-8;
    double x = x0;
    for (int i = 0; i < max_i; ++i)
    {
        x = 1.5 * x - 0.5 * a * x * x * x;
        if (fabs(1 / sqrt(a) - x) < epsilon)
        {
            return x;
        }
    }
    return x;
}

int main()
{
    double a = 2.0;
    double x0_values[] = {-4, -2.0, -1.5, -1.0, -0.5, 0.5, 1.0, 1.5, 2.0};

    for (int i = 0; i < 9; i++)
    {
        double x = calculateApproximation(x0_values[i], a);
        printf("Dla x0 = %.1f, przyblizenie %.1f wynosi %.8f\n", x0_values[i], a, x);
    }

    return 0;
}
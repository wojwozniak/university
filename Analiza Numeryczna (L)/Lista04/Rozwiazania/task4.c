#include <stdio.h>
#include <math.h>

double function(double x)
{
    return pow(x, 4) - log(x + 4);
}

double estimateZero(double a, double b, double epsilon)
{
    int n = (int)ceil(log2((b - a) / (2 * epsilon)));

    for (int krok = 0; krok < n; krok++)
    {
        double mn = (a + b) / 2;
        double mnv = function(mn);

        if (mnv == 0 || (b - a) / 2 < epsilon)
        {
            return mn;
        }

        if (mnv * function(a) < 0)
        {
            b = mn;
        }
        else
        {
            a = mn;
        }
    }
    return (a + b) / 2;
}

int main()
{
    double a1 = -2;
    double b1 = 0;
    double a2 = 0;
    double b2 = 2;
    double epsilon = pow(10, -8);
    printf("Epsilon: %.9lf\n", epsilon);

    double x1 = estimateZero(a1, b1, epsilon);
    double x2 = estimateZero(a2, b2, epsilon);
    printf("Estimated zero x1: %.9lf\n", x1);
    printf("Estimated zero x2: %.9lf\n", x2);
    return 0;
}
#include <iostream>
#include <cmath>
#include <vector>
#include <functional>
#include <numeric>

using namespace std;

/* Obliczanie całki */

double f(double x, int n) {
    return pow(x, n) / (x + 2023);
}

double calculateInIntegral(int n) {
    double dx = 0.0001;
    double suma = 0.0;
    for (double x = 0; x <= 1; x += dx) {
        suma += f(x, n) * dx;
    }
    return suma;
}
/* Koniec obliczania całki */

/* Obliczanie I_n z zależności rekurencyjnej */
double calculateIn(int n) {
    if (n == 0) {
        double x = 2024.0 / 2023.0;
        double out = log(x);
        return out; // I0 = ln(2024 / 2023)
    }

    double In_1 = calculateIn(n - 1);
    return (1.0 / n) - 2023.0 * In_1;
}

int main() {
    vector<double> oddResults; // Przechowuje wyniki dla I1, I3, ..., I19
    vector<double> evenResults; // Przechowuje wyniki dla I2, I4, ..., I20
    vector<double> integralResults; // Przechowuje wyniki dla I1, I2, I3, ..., I20 z całki

    for (int n = 1; n <= 20; ++n) {
        double In_result = calculateIn(n);
        if (n % 2 == 1) {
            oddResults.push_back(In_result);
        } else {
            evenResults.push_back(In_result);
        }
        integralResults.push_back(calculateInIntegral(n));
    }

    cout << "Wyniki dla podciagu I1, I3, ..., I19:" << endl;
    for (int i = 0; i < oddResults.size(); ++i) {
        cout << "I" << 2 * i + 1 << "         = " << oddResults[i] << endl;
        cout << "I" << 2 * i + 1 << " z calki = " << integralResults[i] << endl;
    }

    cout << "Wyniki dla podciagu I2, I4, ..., I20:" << endl;
    for (int i = 0; i < evenResults.size(); ++i) {
        cout << "I" << 2 * i + 2 << "         = " << evenResults[i] << endl;
        cout << "I" << 2 * i + 2 << " z calki = " << integralResults[i] << endl;
    }

    return 0;
}
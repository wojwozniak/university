#include <stdio.h>

int main() {
    double licznik = 1;
    double mianownik = 1;

    double result = 4 * licznik / mianownik;
    for(long i = 0; i < 1999999; ++i) {
        licznik *= -1;
        mianownik += 2;
        result += 4 * licznik / mianownik;
    }
    printf("%.9lf\n", result);
}

// (Najpierw pierwsze 6 cyfr, po spacji reszta)

// Pi = 3.141592 654

// gdy dojdziemy do 1999998 iteracji, to mamy
// 3.141593 154

// przy 1 999 999 iteracji mamy
// 3.141592 154 (czyli git)

// przy 2 000 000 iteracji mamy
// 3.141593 154 (tak samo)
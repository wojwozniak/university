#include <stdio.h>

int main() {
    double y0 = 1.0;
    double y1 = - (1.0 / 9.0);

    printf("y0 = %lf\n", y0);
    printf("y1 = %lf\n", y1);

    for (int n = 2; n <= 50; n++) {
        double yn = 80.0 / 9.0 * y1 + y0;
        printf("y%d = %lf\n", n, yn);

        y0 = y1;
        y1 = yn;
    }

    return 0;
}

// y0 = 1.000000   - początkowa wartość 
// y1 = -0.111111  - początkowa wartość
// y2 = 0.012346   - 1/81 ze wzoru, git
// y3 = -0.001372  - -1/729 ze wzoru, git
// y4 = 0.000152   - 1/6561 ze wzoru, git
// potem zaczyna powoli sie zokraglac do zera
// prawdziwa zabawa od y13, gdzie liczba zaczyna z powrotem rosnąć
// No więc wyniki wiarygodne nie są
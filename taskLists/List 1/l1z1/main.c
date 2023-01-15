#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int a = 10;
    double xmax = 0;
    double xmin = 1;
    scanf("%d", &a);
    if(a < 10) {
        return 0;
    }
    srand(time(NULL));
    for(int i=0; i < a; i++) {
        double b = rand() / (double)RAND_MAX;
        printf("%lf", b);
        printf("\n");
        if(b > xmax) {
            xmax = b;
        }
        if(b < xmin) {
            xmin = b;
        }
    }
        printf("%0.3lf", xmax);
        printf("\n");
        printf("%0.3lf", xmin);
        printf("\n");
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main() {
    int n = 0;
    printf("Podaj n: ");
    scanf("%d", &n);
    int a, b;
    if (n == 1) {
        printf("-1");
    } else if (n%2==0) {
        a = -1;
        b = n*(n-1);
    } else {
        b = n * (n-1) * (n-2);
        a = - n - (n-1) * (n-2);
    }
    printf("\n%d\n----\n %d", a, b);
    return 0;
}

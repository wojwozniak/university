#include <stdio.h>
#include <stdlib.h>

int main() {
    int a = 1, b = 1, c = 1;
    int d = 1;
    int i = 2;
    int n = 2;
    printf("Podaj n: ");
    scanf("%d", &n);
    while(i<n) {
        d = (a + b + c);
        a = b;
        b = c;
        c = d;
        i++;
    }
    printf("%d", d);
}

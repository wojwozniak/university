#include <stdio.h>
#include <stdlib.h>

int main() {
    int n, x;
    printf("Podaj n: ");
    scanf("%d", &n);
    printf("Podaj x: ");
    scanf("%d", &x);
    int a = 1;
    int y = 0; //output
    for(int i=1; i<=n; i++) {
        a*=x;
        y+=i*a;
        //printf("a: %d i: %d, y: %d \n", a,i,y);
    }
    printf("Wynik: %d", y);
}

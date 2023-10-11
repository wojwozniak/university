#include <stdio.h>
#include <stdlib.h>

int main() {
    int a, b;
    printf("Podaj a: ");
    scanf("%d", &a);
    printf("Podaj b: ");
    scanf("%d", &b);
    int c;
    if(a>b) {
        c = b;
    } else {
        c = a;
    }
    for(int i=c; i>=1; i--) {
        if(a%i==0 && b%i==0) {
            a/=i;
            b/=i;
        }
    }
    printf("\n %d\n----\n %d", a, b);
}

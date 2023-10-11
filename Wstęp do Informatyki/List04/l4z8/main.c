#include <stdio.h>
#include <stdlib.h>

int main() {
    int a[10];
    int b[10];
    int n, m;
    printf("Podaj n: ");
    scanf("%d", &n);
    printf("Podaj m: ");
    scanf("%d", &m);
    for(int i=0; i<10; i++) {
        a[i] = 0;
        b[i] = 0;
    }
    int x = 0;
    while(1) {
        x = n%10;
        a[x]++;
        n/=10;
        if(n<10) {
            a[n]++;
            break;
        }
    }
    while(1) {
        x = m%10;
        b[x]++;
        m/=10;
        if(m<10) {
            b[m]++;
            break;
        }
    }
    for(int i=0; i<10; i++) {
        if(a[i]!=b[i]) {
            printf("Nie sa podobne ze wzgledu na rozna ilosc wystapien liczby %d", i);
            return 0;
        }
    }
    printf("Sa podobne!");
    return 1;
}

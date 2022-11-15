#include <stdio.h>
#include <stdlib.h>

int NWD(int a, int b) {
    while(a!=b) {
       if(a>b) {
           a-=b;
           }
       else b-=a;
    }
    return a;
}

int main() {
    int n, a, b;
    printf("Podaj n: ");
    scanf("%d", &n);
    printf("Podaj pierwsza liczbe z ciagu: ");
    scanf("%d", &a);
    if(n==1) {
        printf("%d", a);
        return 0;
    }
    for(int i=2; i<=n; i++) {
        printf("Podaj %d. liczbe: ", i);
        scanf("%d", &b);
        a = NWD(a, b);
        printf("Aktualne NWD: %d \n", a);
        if(a==1) {
            printf("Ostateczne NWD sie nie zmieni niezaleznie od dalszych liczb! Przerywam mozliwosc dodawania!\n");
            break;
        }
    }
    printf("Ostateczne NWD: %d \n", a);
}

#include <stdio.h>
#include <stdlib.h>

int main() {
    int n, ncopy, p, k=2, i=0, imax=0;
    // k - liczba ktora aktualnie sprawdzamy, i - potega, o - liczba do wypisania
    printf("Podaj n: ");
    scanf("%d", &n);
    printf("Podaj p: ");
    scanf("%d", &p);
    ncopy = n;
    while(n > 1) {
        i = 0;
        while(n%k==0) {
          //  printf("n: %d, i: %d \n", n, i);
            n/=k;
            i++;
        }
        if(i>imax) {
            imax = i;
        }
        k++;
    }
    printf("%d", imax);
    k = 2;
    while(ncopy > 1) {
        i = 0;
        while(ncopy%k==0) {
          //  printf("n: %d, i: %d \n", n, i);
            ncopy/=k;
            i++;
        }
        if(i==imax) {
            printf(" %d", k);
        }
        k++;
    }
    return 0;
}

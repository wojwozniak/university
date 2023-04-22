#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define RANGE 10000

int table[RANGE];

int isPrime(int x) {
    if(x == 2) {
        return 1;
    } else {
        for(int i=2; i*i<x; i++) {
            if(x%i==0) {
                return 0;
            }
        }
    }
    return 1;
}

int main() {
    for(int i=0; i<RANGE; i++) {
        table[i] = 1;
    }
    int m;
    int n;
    printf("Podaj m: ");
    scanf("%d", &m);
    printf("Podaj n: ");
    scanf("%d", &n);
    int a;
    for(int i=m; i<=n; i++) {
        if(isPrime(i)) {
            a = 2*i;
            while(a<=n) {
                table[a-m] = 0;
                a+=i;
            }
        } else {
            table[i-m] = 0;
        }
    }
    for(int i=0; i<=n-m; i++) {
        if(table[i] == 1) {
            printf("%d ", i+m);
        }
    }
    return 0;
}

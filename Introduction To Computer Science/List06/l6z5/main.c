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
    table[0] = 0;
    table[1] = 0;
    int n;
    printf("Podaj n: ");
    scanf("%d", &n);
    int a;
    for(int i=2; i*i<n; i++) {
        if(isPrime(i)) {
            a = 2*i;
            while(a<=n) {
                table[a] = 0;
                a+=i;
            }
        }
    }
    for(int i=2; i<=n; i++) {
        printf("%d: %d\n",i,table[i]);
    }
    return 0;
}

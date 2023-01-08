#include <stdio.h>
#include <stdlib.h>

int queens() {
    int k = 1, wynik = 0;
    b[0] = 0;
    while(k>=0) {
        do {
            b[k]++;
        }
        while(b[k]<n && !isfree(k, b[k])) {
                if(b[k] < n) {
                    k++;
                } else {
                    b[k] = -1;
                    k--;
                }
                if (k == n) {
                    wynik++;
                    k--;
                    b[k]++;
                }
        }
    }
    return wynik;
}

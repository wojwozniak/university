#include <stdio.h>
#include <stdlib.h>

bool poprawne(int a[], int n) {
    for(int i=0; i<n; i++) {
        for(int j=i+1; j<n; j++) {
            if(a[i] == a[j] || a[i]-i == a[i]-j || a[i]+i == a[i]+j) {
                return false;
            }
        }
    }
    return true;
}

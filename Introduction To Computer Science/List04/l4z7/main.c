#include <stdio.h>
#include <stdlib.h>

int main() {
    int a[10];
    int n;
    printf("Podaj n: ");
    scanf("%d", &n);
    for(int i=0; i<10; i++) {
        a[i] = 0;
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
    int output = 0;
    for(int i=0; i<10; i++) {
        if(a[i]>0) {
            output++;
        }
    }
    printf("%d", output);
}

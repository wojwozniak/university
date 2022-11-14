#include <stdio.h>
#include <stdlib.h>

int main() {
    long long d;
    int k;
    printf("Podaj d: ");
    scanf("%lli", &d);
    printf("Podaj k: ");
    scanf("%d", &k);
    if(k<2 || k>36) {
        printf("Zly input \n");
        return 0;
    }
    int y = 1; // lb znaczace
    int x = 1; // skala
    while(x<=d) {
        x*=k;
        y++;
    }
    x/=k;
    //printf("x: %d \n", x);
    while(y >= 0) {
        int o = 0;
        while(d >= 0) {
            d-=x;
            o++;
        }
        d+=x;
        o--;
        if(k < 10) {
            printf("%d", o);
        } else {
            if(o < 10) {
                printf("%d", o);
            } else {
                o+=55;
                printf("%c", o);
            }
        }
        y-=1;
        x/=k;
        if(d==0) {
            for(int i=1; i<y; i++) {
                printf("0");
            }
            break;
        }
    }
    return 0;
}

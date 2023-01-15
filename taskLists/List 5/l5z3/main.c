#include <stdio.h>
#include <stdlib.h>

int main() {
    long int d;
    if (scanf("%ld", &d)){}
    int copyd = d/2;
    int a=0, b=0, c=0, e;
    d*=d;
    for(int i=1; i*i<d; i++) {
        for(int y=1; y*y<d; y++) {
            for(int z=1; z*z<d; z++) {
                if(i*i+y*y+z*z == d) {
                    //printf("%d %d %d \n", i,y,z);
                    if(a+b+c < i+y+z) {
                        a = i;
                        b = y;
                        c = z;
                    }
                    if((a>=copyd)&(b>=copyd)&(c>=copyd)) {
                        goto found;
                    }
                }
            }
        }
    }
    found:
    if(a!=0) {
        if(a<b) {
            e = b;
            b = a;
            a = e;
        }
        if(a<c) {
            e = c;
            c = a;
            a = e;
        }
        if(b<c) {
            e = c;
            c = b;
            b = e;
        }
        printf("%d %d %d \n", a,b,c);
    } else {
        printf("BRAK");
    }
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int absolute(int a) {
    if(a < 0) {
        return a*(-1);
    }
    return a;
}

void printit(long x, int depth) {
    if(depth < 5) {
        printit(x/10, depth+1);
    }
    printf("%li", x%10);
}

int main() {
    int a, deg, arg, abc;
    int vars[65536];
    //printf("How many?\n");
    abc = scanf("%d", &a);
    //printf("%d times\n", a);
    long num;
    long walking;
    for(int i=0; i<a; i++) {
        num = 0;
        walking = 1;
        abc = scanf("%d %d", &deg, &arg);
        //printf("Degree %d, arg %d\n", deg, arg);
        for(int b=0; b<=deg; b++) {
            abc = scanf("%d", &vars[b]);
        }
        for(int b=deg; b>=0; b--) {
            //printf("Walking: %d \n", walking);
            //printf("%d\n", vars[b]);
            long add = vars[b]*walking;
            //printf("Add %d\n", add);
            num+=add;
            //printf("Now %d\n", num);
            walking*=arg;
        }
        if(absolute(num) < 100000) {
            printf("%05d\n", absolute(num));
        } else {
            printit(absolute(num), 1);
            printf("\n");
        }
    }
    a = abc;
}

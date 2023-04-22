#include <stdio.h>
#include <stdlib.h>

int absolute(int a) {
    if(a < 0) {
        return a*(-1);
    }
    return a;
}

int printit(long x, int depth) {
    int output = 0;
    if(depth < 5) {
        output += printit(x/10, depth+1);
    }
    output*=10;
    output += x%10;
    return output;
}

int main() {
    int a, deg, arg, abc;
    int vars[65536];
    abc = scanf("%d", &a);
    long num;
    long walking;
    for(int i=0; i<a; i++) {
        num = 0;
        walking = 1;
        fflush(stdin);
        abc = scanf("%d %d", &deg, &arg);
        for(int b=0; b<=deg; b++) {
            abc = scanf("%d", &vars[b]);
        }
        for(int b=deg; b>=0; b--) {
            long add = vars[b]*walking;
            num+=add;
            walking*=arg;
        }
        if(absolute(num) < 100000) {
            printf("%05d\n", absolute(num));
        } else {
            printf("%05d\n", printit(absolute(num), 1));
        }
    }
    a = abc;
}

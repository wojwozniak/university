#include <stdio.h>
#include <stdlib.h>

int NWD(int a, int b) {
    while(a!=b) {
       if(a>b) {
           a-=b;
           }
       else b-=a;
    }
    return a;
}

int main(){
    int a, b;
    printf("Podaj a: ");
    scanf("%d", &a);
    printf("Podaj b: ");
    scanf("%d", &b);
    int output = a / NWD(a, b);
    output*=b;
    printf("NWW %d i %d to %d", a, b, output);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

unsigned long int main() {
    unsigned long int a;
    scanf("%li", &a);
    int check;
    for(unsigned long int x=a; x<=(a+1000); x++) {
        check = 0;
        for (unsigned long int i=2; i*i<=x; i++) {
            if(x%(i*i)==0) {
                check++;
            }
        }
        if(check == 0) {
            printf("%li", x);
            return x;
        }
    }
    printf("BRAK");
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main() {
    int input;
    while(1) {
        input = 0;
        printf("Podaj liczbe z przedzialu 1-20: ");
        int s = scanf("%d", &input);
        if(!(input>=1&&input<=20) || s!=1) {
            printf("Zly input! \n");
            fflush(stdin);
            continue;
        }
        printf("Podano liczbe %d \n", input);
        if(input == 1) {
            printf("*\n");
            continue;
        }
        int x = 0;
        int y = 2 * input - 1;
        int z = y;
        int b = 0;
        for(int a = 0; a<input-1; a++) {
            b=0;
             for(int i=0; i<=z; i++) {
                if(i==x || i==y) {
                    printf("*");
                } else {
                    if(i>x) {
                        b++;
                    }
                    if(b==1) {
                       continue;
                    }
                    printf(" ");
                }
            }
            printf("\n");
            if(x==y) {
                break;
            }
            x++;
            y--;
        }
        for(int i=0; i<=z; i++) {
            if(i==z/2) {
                printf("*");
            }
            printf(" ");
        }
        printf("\n");
    }
}

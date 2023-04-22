#include <stdio.h>
#include <stdlib.h>

#define MAXLENGTH 80

int main(int argc, char *argv[]) {
    char z[MAXLENGTH];
    char n[MAXLENGTH];
    int zz;
    if(argc < 2) {
        return 1;
    } else if (atoi(argv[2]) >= MAXLENGTH) {
        printf("Za duza lb");
    } else {
        int x = 0;
        while(argv[1][x] != '\0') {
            z[x] = argv[1][x];
            //printf("%c", argv[1][x]);
            x++;
        }
        if(x > 80) {
            printf("Za dlugi arg wywolania");
            return 0;
        }
    }
    zz = atoi(argv[2]);
   // printf("%d", zz);
    char a[MAXLENGTH];
    char x;
    int i = 0;
    while(1) {
        scanf("%c", &x);
        if(x == '\n') {
            break;
        } else if (x == '/0') {
            break;
        }
        else if (i<80 && ((int)x >=48 || (int)x == 32  )) {
            a[i] = x;
        }
        i++;
    }
    int savei = i;
    if (savei < zz)  {
        printf("Za krotki podany napis!");
        return 1;
    } else if (savei+zz+1 > 80) {
        printf("Napis przekroczylby 80 znakow");
        return 1;
    } else {
        i = 0;
        while(i < zz) {
            n[i] = a[i];
            i++;
        }
        int g = 0;
        for(g = 0; g<=zz; g++) {
            n[g+i] = z[g];
        }
        g = zz;
        while(g+i < savei + zz) {
            //printf("a");
            n[g+i] = a[i];
            i++;
        }
    for(int i =0; i<savei+zz; i++) {
        printf("%c", n[i]);
    }
    }
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    int rozmiar = 100;
    char a[rozmiar];
    for(int i=0; i<rozmiar; i++) {
        a[i] = 'a';
    }
    long long d;
    int k;
    printf("Podaj n: ");
    scanf("%lli", &d);
    printf("Podaj k: ");
    scanf("%d", &k);
    int y = 1; // lb znaczace
    int x = 1; // skala
    while(x<=d) {
        x*=k;
        y++;
    }
    x/=k;
    int c = 0;
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
            a[c] = o+'0';
            c++;
            //printf("%d", o);
        } else {
            if(o < 10) {
                a[c] = o+'0';
                c++;
               //printf("%d", o);
            } else {
                o+=55;
                a[c]=o;
                c++;
               // printf("%c", o);
            }
        }
        y-=1;
        x/=k;
        if(d==0) {
            for(int i=1; i<y; i++) {
                a[c] = '0';
                c++;
               // printf("0");
            }
            break;
        }
    }
    //printf("\n%s", a);
    // Teraz szukamy ostatniego wystapienia znaku w funkcji
    int z = 0; // indeks ost. znaku !=a
    for(int i = 0; i<rozmiar; i++) {
        if(a[i]=='a') {
            break;
        } else {
        z++;
        }
    }
    //printf("\n%d", z);
    if(z == 1) {
        printf("Palindrom");
    } else {
        for(int i = 0; i<z/2; i++) {
            if(a[i]!=a[z-1-i]) {
                printf("Nie palindrom!");
                return 0;
            }
        }
        printf("Palindrom");
    }
    return 1;
}

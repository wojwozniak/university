#include <stdio.h>
#include <stdlib.h>

int main() {
    int i = 1;
    int war_silni = 1;
    int output = 0;
    int n;
    int ilosc_operacji = 0;
    printf("Podaj n: ");
    scanf("%d", &n);
    while(war_silni <= n) {
        war_silni*=i;
        i++;
        ilosc_operacji+=3;
    }
    i--;
    war_silni/=i;
    i--;
    ilosc_operacji+=3;
    int limit_si;
    while(war_silni > 0 && i>0) {
        limit_si = i;
        output = 0;
        ilosc_operacji+=4;
        while(limit_si > 0 && war_silni <= n) {
            limit_si--;
            n-=war_silni;
            output++;
            ilosc_operacji+=5;
        }
        printf("%d", output);
        war_silni/=i;
        i--;
        ilosc_operacji+=2;
    }
    printf("\nIlosc operacji: %d", ilosc_operacji);
    return 0;
}

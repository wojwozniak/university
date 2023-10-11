#include <stdio.h>
#include <stdlib.h>

int main() {
    int i = 1;
    int war_silni = 1;
    int output = 0;
    int n;
    printf("Podaj n: ");
    scanf("%d", &n);
    while(war_silni <= n) {
        war_silni*=i;
        i++;
    }
    i--;
    war_silni/=i;
    i--;
    int limit_si;
    while(war_silni > 0 && i>0) {
        limit_si = i;
        output = 0;
        while(limit_si > 0 && war_silni <= n) {
            limit_si--;
            n-=war_silni;
            output++;
        }
        printf("%d", output);
        war_silni/=i;
        i--;
    }
    return 0;
}

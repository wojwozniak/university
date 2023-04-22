#include <stdio.h>
#include <stdlib.h>

int fTrec(int n, int m) {
    if(n == 0) {
        return m;
    } else if (m == 0) {
        return n;
    } else {
        return (fTrec(n-1, m)+ 2*fTrec(n, m-1));
    }

}

int main() {
    int n, m;
    printf("Podaj n: ");
    scanf("%d", &n);
    printf("Podaj m: ");
    scanf("%d", &m);
    int x = fTrec(n,m);
    printf("%d", x);
}

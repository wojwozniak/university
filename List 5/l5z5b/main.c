#include <stdio.h>
#include <stdlib.h>

int fIter(int n, int m) {
    int tab[m+1];
    for(int i=0; i<=n; i++) {
        tab[i] = i;
      //  printf("%d ", tab[i]);
    }
    for(int i=1; i<n; i++) {
        tab[0] = i;
        //printf("\n%d ", tab[0]);
        for(int y=1; y<=m+1; y++) {
            tab[y] += 2*tab[y-1];
           // printf("%d ", tab[y]);
        }
    }
    return tab[m+1];
}

int main() {
    int m, n;
    printf("Podaj n: ");
    scanf("%d", &n);
    printf("Podaj m: ");
    scanf("%d", &m);
    int x = fIter(m,n);
    printf("%d", x);
}

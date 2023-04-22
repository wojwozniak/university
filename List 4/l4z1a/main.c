#include <stdio.h>
#include <stdlib.h>

int main() {
    int n = 0;
    printf("Podaj n: ");
    scanf("%d", &n);
    if(n%2==0) {
        printf("%d", n);
    } else {
        n*=-1;
        printf("%d", n);
    }
}

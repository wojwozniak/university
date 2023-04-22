#include <stdio.h>
#include <stdlib.h>

void hanoi(int n, char from, char to, char pom) {
    if(n==1) {
        printf("Moved circle 1 from %c to %c\n", from, to);
        return;
    }
    hanoi(n-1, from, pom, to);
     printf("Moved circle %d from %c to %c\n", n, from, to);
    hanoi(n-1, pom, to, from);
}

int main() {
    int n = 4; // Kó³ka
    hanoi(n, 'A', 'B', 'C');
    return 0;
}

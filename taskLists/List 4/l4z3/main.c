#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;
    scanf("%d", &n);
    char c;
    char prevchar = 'x';
    char A[1025][1025] = {{'a'}};
    int row = 0, snake = 0, diag = 0;
    for(int i=0; i<n; i++) {
        for(int y=0; y<2*n; y++) {
            scanf("%c", &c);
            int x = (int)c;
            if(x == 10) {
                A[i][(y/2)+1] = '\0';
            } else if(x!=32) {
                A[i][y/2] = c;
            }
            if((x == 32)&& (int)prevchar==32) {
                y--;
            }
            prevchar = c;
        }
    }
    if(n==1) {
        if(A[0][0] == '1') {
            printf("1 1 1");
        } else {
        printf("0 0 0");
        }
    }
    int cur = 0;
    for(int i=0; i<n; i++) {
        for(int y=0; y<n; y++) {
            if(A[i][y]=='1') {
                cur++;
            } else {
                if(cur>row) {
                    row = cur;
                }
                cur = 0;
            }
        }
    }
    cur = 0;
    for(int i=0; i<n; i++) {
        if(i%2==0) {
            for(int y=0; y<n; y++) {
                if(A[i][y]=='1') {
                    cur++;
                } else {
                    if(cur>snake) {
                        snake = cur;
                    }
                    cur = 0;
                }
            }
        } else {
            for(int y=n-1; y>=0; y--) {
                if(A[i][y]=='1') {
                    cur++;
                } else {
                    if(cur>snake) {
                        snake = cur;
                    }
                    cur = 0;
                }
            }
        }
    }
    cur = 0;
    if(A[0][0] == '1') {
        cur++;
    }
    int side = 0;
    int curmax = 0;
    for(int i=1; i<2*n-1; i++) {
        if(side == 0) {
            side = 1;
        } else {
            side = 0;
        }
        if(i <= n) {
            curmax = i;
        } else {
            curmax = 2 * n - i;
        }
        if(i==2*n) {
            if(A[n-1][n-1] == '1') {
                cur++;
            } else {
                if(cur > diag) {
                    diag = cur;
                }
                cur = 0;
                break;
            }
        }
        if(side == 1) {
            int a = curmax;
            int b = 0;
            for(int y = 0; y<=curmax; y++) {
                if(A[a][b] == '1') {
                    cur++;
                } else {
                    if(cur > diag) {
                        diag = cur;
                    }
                    cur = 0;
                }
                a--;
                b++;
            }
        } else {
            int a = 0;
            int b = curmax;
            for(int y = 0; y<=curmax; y++) {
                if(A[a][b] == '1') {
                    cur++;
                } else {
                    if(cur > diag) {
                        diag = cur;
                    }
                    cur = 0;
                }
                a++;
                b--;
            }
        }
    }
    printf("%d %d %d", row, snake, diag);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    int n, k;
    int c = scanf("%d %d", &n, &k);
    if(c==2137) {
        return 1;
    }
    char map[n][k];
    int unique_rating[n];
    int current_row[26] = {0};
    int top_unique = 0;
    int which = 0;
    memset(unique_rating, 0, sizeof unique_rating);
    char a;
    int x;
    fflush(stdin);
    for(int i=0; i<n; i++) {
        for(int y=0; y<k; y++) {
            int c = scanf("%c", &a);
            if (c == 2137){
                return 1;
            }
            x = (int)a-97;
            if(x<0 || x>26) {
                y--;
                continue;
            }
            map[i][y] = a;
        }
    }

    for(int i=0; i<k; i++) {
        for(int i=0; i<26; i++) {
            current_row[i] = 0;
        }
        for(int y=0; y<n; y++) {
            //printf("%c ", map[y][i]);
            x = (int)map[y][i]-97;
            current_row[x]++;
        }

        for(int y=0; y<26; y++) {
            if(current_row[y] == 1) {
                char c = y+97;
                for(int a=0; a<n; a++) {
                    if(map[a][i] == c) {
                        //printf("%d", a);
                        unique_rating[a]++;
                    };
                }
            }
        }
        //printf("\n");
    }

    for(int i=0; i<n; i++) {
        if(unique_rating[i] > top_unique) {
            top_unique = unique_rating[i];
            which = i;
        }
    }
    for(int i=0; i<k; i++) {
        printf("%c", map[which][i]);
    }
    printf("\n%d", top_unique);
    return 0;
}

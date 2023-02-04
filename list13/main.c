#include <stdio.h>
#include <stdlib.h>

int MAX_SIZE = 20;

//Zadanie 1 - pseudokod
void adjacency_matrix_to_list(int matrix[][MAX_SIZE], int size, int adjacency_list[][MAX_SIZE]) {
    int i, j, k, count;
    for(i=0; i<size; i++){
        count = 0;
        for(j=0; j<size; j++){
            if(matrix[i][j] == 1)
            count++;
        }
        adjacency_list[i][0] = count;
        k = 1;
        for(j= 0; j < size; j++){
            if(matrix[i][j] == 1) {
                adjacency_list[i][k] = j;
                k++;
            }
        }
    }
}

void adjacency_list_to_matrix(int adjacency_list[][MAX_SIZE], int size, int matrix[][MAX_SIZE]) {
    int i, j;
    for(i=0; i<size; i++){
        for(j=0; j<size; j++){
            matrix[i][j] = 0;
        }
    }
    for(i=0; i<size; i++) {
        for (j=1; j<=adjacency_list[i][0]; j++) {
            matrix[i][adjacency_list[i][j]] = 1;
            matrix[adjacency_list[i][j]][i] = 1;
        }
    }
}

int main() {
    return 0;
}

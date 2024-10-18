#include <stdio.h>
#include <stdlib.h>

void selectionSort(int arr[], int n) {
    int smallest;
    int helper;
    for(int i=0; i<n; i++) {
        smallest = i;
        for(int j=i+1; j<n; j++) {
            if(arr[j] < arr[smallest]) {
                    smallest = j;
            }
        }
        helper = arr[smallest];
        arr[smallest] = arr[i];
        arr[i] = helper;
    }
}

int main() {
    int arr[] = {13, 22, 3, 23, 1, 2, 3};
    int n = sizeof(arr) / sizeof(arr[0]);
    selectionSort(arr, n);
    for(int i=0; i<n; i++) {
        printf("%d ", arr[i]);
    }
    return 0;
}

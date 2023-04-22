#include <stdio.h>
#include <stdlib.h>

void bubbleSort(int arr[], int n) {
    int helper;
    for(int i=0; i<n; i++) {
        for(int j=0; j<n-1; j++) {
            if(arr[i] < arr[j]) {
                helper = arr[i];
                arr[i] = arr[j];
                arr[j] = helper;
            }
        }
    }
}

int main() {
    int arr[] = {13, 22, 3, 23, 1, 2, 3};
    int n = sizeof(arr) / sizeof(arr[0]);
    bubbleSort(arr, n);
    for(int i=0; i<n; i++) {
        printf("%d ", arr[i]);
    }
    return 0;
}

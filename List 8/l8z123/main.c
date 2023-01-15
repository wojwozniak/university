#include <stdio.h>
#include <stdlib.h>

int zad1(int n){
    if(n==1) {
        return 1;
    }
    else return zad1(n-1) + n;
}

int zad2(int n){
    if(n==1) {
        return 0;
    } else if (n%2==0) {
        return zad2(n/2) + 1;
    } else {
        return zad2((n+1)/2)+1;
    }
}

int zad3(int n){
    if(n==1) {
        return 1;
    } else if(n%2==0) {
        return 2*zad3(n/2)+1;
    } else {
        return zad3((n-1)/2) + zad3((n+1)/2) + 1;
    }
}

int main() {
    int jeden = zad1(16);
    printf("Zadanie 1: %d\n", jeden);
    // 136
    int dwa = zad2(16);
    printf("Zadanie 2: %d\n", dwa);
    // 4
    int trzy = zad3(16);
    printf("Zadanie 3: %d\n", trzy);
    //31
    return 0;
}

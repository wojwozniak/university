#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "headers.h"
#include "functions.c"

int main(int argc, char *argv[]) {
    node *root = NULL;

    if(argc <= 2) {
        return 1;
    } else {
        for(int i=1; i<argc; i++) {
            int x = parsefile(argv[i], &root);
            if(x == 1) {
                printf("ERROR! Konczenie dzialania programu!\n");
                return 1;
            }
        }
    }
    int choice = 0;
    while(1) {
        fflush(stdin);
        printf("----------------------------------\nDrzewo Trie\n0 - Zakoncz\n1 - Wypisz cala zawartosc drzewa\n2 - Wyszukaj slowo\n3 - Dodaj slowo\nTwoj wybor: ");
        scanf("%d", &choice);
        if(choice == 0) {
            return 0;
        } else if (choice == 1) {
            print(root);
        } else if (choice == 2  || choice == 3) {
            char a[64];
            memset(a, '/0', sizeof(a));
            printf("Podaj slowo: ");
            scanf("%s", &a);
            if(choice == 2) {
                callsearch(root, a);
            } else {
                inserto(&root, a);
            }
        } else {
            printf("Nie rozpoznano polecenia. Sprobuj jeszcze raz!\n");
        }
    }
    return 0;
}

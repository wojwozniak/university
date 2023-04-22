#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include "headers.h"
#include "functions.c"



int main(int argc, char *argv[]) {
    if(argc < 2) {
        return 1;
    }
    FILE *textfile = fopen(argv[1], "r");
    if(textfile == NULL) {
        return 1;
    }
    int a, b, x, y;
    fscanf(textfile, "%d", &a);
    fscanf(textfile, "%d", &b);
    graph *g1 = create_graph(a);
    while(!feof(textfile)) {
        fscanf(textfile, "%d", &x);
        fscanf(textfile, "%d", &y);
        add_edge(g1, x, y);
    }


    printf("Graf wczytany!\n");
    int choice = 0;
    bool visited[g1->numnodes];
    while(1) {
        printf("Opcje:\n");
        printf("0 - wyjdz\n1 - wypisz graf\n2 - przeszukaj w glab od pkt\n3 - Spojne skladowa grafu\n");
        printf("Twoj wybor: ");
        int ret;
        scanf("%d", &choice);
        switch(choice) {
            case 0:
                destroy_graph(g1);
                return 0;
            case 1:
                for(int i=0; i<g1->numnodes; i++) {
                    visited[i] = 0;
                }
                print_graph(g1);
                break;
            case 2:
                printf("");
                for(int i=0; i<g1->numnodes; i++) {
                    visited[i] = 0;
                }
                printf("Podaj punkt: ");
                scanf("%d", &choice);
                traverse(g1, choice, 0, visited, 0);
                break;
            case 3:
                for(int i=0; i<g1->numnodes; i++) {
                    visited[i] = 0;
                }
                printf("");
                ret = intergrity(g1);
                printf("%d spojne skladowe!\n", ret);
                break;
            default:
                printf("Nie rozpoznano, sprobuj jeszcze raz!\n");
                break;
        }
    }
}

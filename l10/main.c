#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct elem {
    int val;
    struct elem *next;
 } elem;

 elem *utworz(int wart) {
     elem *fin = malloc(sizeof(elem));
     fin->val = wart;
     fin->next = NULL;
     return fin;
 };

 // Task 1
 int *attach_elem(elem *node, int wart) {
     if(node->next == NULL) {
        node->next = utworz(wart);
        return 0;
     } else {
         attach_elem(node->next, wart);
     }
 }

 //Task 2
 int *delete_last(elem *node, elem *parent) {
     if(node->next == NULL) {
        parent->next = NULL;
        return 0;
     } else {
         delete_last(node->next, node);
     }
 }

int main() {
    return 0;
}

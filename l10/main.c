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
 void attach_elem(elem *node, int wart) {
     if(node->next == NULL) {
        node->next = utworz(wart);
        return;
     }
    attach_elem(node->next, wart);
 }

 //Task 2
 void delete_last(elem *node, elem *parent) {
     if(node->next == NULL) {
        free(node);
        parent->next = NULL;
        return;
     }
    delete_last(node->next, node);
 }

 //Task 3
 void connect_lists(elem *first, elem *second) {
     if(first->next == NULL) {
        first->next = second;
        return;
     }
     connect_lists(first->next, second);
 }

int main() {
    return 0;
}

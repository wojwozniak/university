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

 //Task 4 (call with NULL as 3rd argument)
 void delete_val(elem *root, int val, elem *parent) {
    if(root->val == val) {
        if(parent == NULL) {
            root = root->next;
            if(root->next == NULL) {
                return;
            } else {
                delete_val(root->next, val, NULL);
            }
        } else {
            parent->next = root->next;
            free(root);
            if(parent->next == NULL) {
                return;
            } else {
                delete_val(parent->next, val, parent);
            }
        }
    } else {
        if(root->next == NULL) {
            return;
        }
        delete_val(root->next, val, root);
    }
 }

 //Task 5
 void add_to_front(elem *root, int val) {
     elem *rootptr = root;
     root = utworz(val);
     root->next = rootptr;
 }

 void delete_from_front(elem *root) {
     elem *trash = root;
     root = root->next;
     free(trash);
 }

int main() {
    return 0;
}

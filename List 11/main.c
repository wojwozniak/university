#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node *pnode;
typedef struct node {
    int val;
    pnode left;
    pnode right;
} snode;

pnode utworz(int wart) {
    pnode output = malloc(sizeof(snode));
    if(output != NULL) {
        output->val = wart;
        output->left = NULL;
        output->right = NULL;
    }
    return output;
}

/* Task 1
Glebokosc drzewa BST bedzie zalezec od kolejnosci w ktorej
wstawiamy elementy.

Najwieksza glebokosc uzyskamy zaczynajac
od najmniejszego lub najwiekszego elementu - wowczas wszystkie
elementy zawsze beda po jednej stronie - glebokosc wyniesie n

Dla najmniejszej glebokosci
a) 4->3->5->2->6->1->7
b) Zaczynamy od 2^k/2, jeden w lewo, jeden w prawo
Nie musi byc koniecznie taka kolejnosc po srodku - Ale
pozwala ona stworzyc prosty algorytm wstawiania elementow
Glebokosc drzewa: k
*/

// Task 2
int tree_count(pnode root) {
    int output = 0;
    if(root == NULL) {
        return 0;
    } else {
        output+=tree_count(root->left);
        output+=tree_count(root->right);
    }
    output+=1;
    return output;
}

//Task 3
int tree_depth(pnode root) {
    if(root == NULL) {
        return 0;
    } else {
        int left_depth = tree_depth(root->left);
        int right_depth = tree_depth(root->right);
        if(left_depth > right_depth) {
            return left_depth + 1;
        } else {
            return right_depth + 1;
        }
    }
}

// Task 4
void print_positive_sorted(pnode root) {
    if(root == NULL) {
        return;
    } else {
        print_positive_sorted(root->left);
        if(root->val > 0) {
            printf("%d\n", root->val);
        }
        print_positive_sorted(root->right);
    }
    return;
}

// Task 5
bool is_tree_bst(pnode root) {
    int count = 0;
    if(root == NULL) {
        return true;
    } else {
        if(root->left == NULL || root->left->val < root->val) {
            count += 1;
        }
        if(root->right == NULL || root->val < root->right->val) {
            count += 1;
        }
        count += is_tree_bst(root->left);
        count += is_tree_bst(root->right);
    }
    if(count == 4) {
        return true;
    } else return false;
}

// Task 6
/* Wystarczy dodac wskaznik z najmniejszej wartosci
drugiego drzewa do najwiekszej pierwszego, a potem
obrocic wskazniki od najwiekszej wartosci pierszego
drzewa do jego korzenia
*/
/*
NOT WORKING YET
void merge_bsts(pnode root, pnode root2) {
    if(root == NULL || root2 == NULL) {
        return;
    }
    pnode largest_from_second = root2;
    while(largest_from_second->left != NULL) {
        largest_from_second = largest_from_second->left;
    }
    pnode traverse_first = root;
    pnode copy_right = traverse_first->right;
    while(traverse_first->right != NULL) {

        copy_right = traverse_first->right;
        traverse_first -> right->
    }
}
*/

// Task 7
void insert_no_rec(pnode root, int val) {
    pnode helper = root;
    pnode last = NULL;
    while(helper != NULL) {
        last = helper;
        if(val < helper->val) {
            helper = helper->left;
        } else if (val > helper->val) {
            helper = helper->right;
        } else {
            printf("Juz tu jest!\n");
            return;
        }
    }
    pnode a = utworz(val);
    if(val < last->val) {
        last->left = a;
        printf("Dodano na lewo od %d\n", last->val);
    } else if (val > last->val) {
        last->right = a;
        printf("Dodano na prawo od %d\n", last->val);
    }
}

//# TODO - tasks 6,8

int main() {
    // Setup for tests
    pnode root = utworz(20);
    root->left = utworz(10);
    root->right = utworz(30);
    root->left->left = utworz(5);
    root->left->left->left = utworz(3);
    root->left->left->left->left = utworz(-2);
    root->right->left = utworz(25);


    // Test for 2
    //printf("%d", tree_count(root));

    //Test for 3
    //printf("%d", tree_depth(root));

    //Test for 4
    //print_positive_sorted(root);

    //Test for 5
    //printf("%d", is_tree_bst(root));

    // Test for 7
    //insert_no_rec(root, 20);
    //insert_no_rec(root, 21);
    //insert_no_rec(root, -1);

    return 0;
}

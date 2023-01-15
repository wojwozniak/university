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

    return 0;
}

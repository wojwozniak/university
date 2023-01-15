#include <stdio.h>
#include <stdlib.h>

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



int main() {
    // Setup for tests
    pnode aaa = utworz(1);
    aaa->left = utworz(20);
    aaa->right = utworz(10);
    aaa->right->left = utworz(12);
    //aaa->right->left->left = utworz(12);


    // Test for 2
    //printf("%d", tree_count(aaa));

    //Test for 3
    //printf("%d", tree_depth(aaa));

    return 0;
}

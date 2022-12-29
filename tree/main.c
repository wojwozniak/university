#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int val;
    struct node *l;
    struct node *r;
} node;

node *create(int val) {
    node *fin = malloc(sizeof(node));
    if(fin != NULL) {
        fin->l = NULL;
        fin->r = NULL;
        fin->val = val;
    }
    return fin;
}

void printspace(int depth) {
    printf("|");
    for(int i=0; i<depth-1; i++) {
        printf(" |");
    }
    return;
}

void printpart(node *root, int depth) {
    if(root == NULL) {
        printf("</> \n");
        return;
    }

    printf("%d \n", root->val);

    printspace(depth);
    printf("-Left: ");
    printpart(root->l, depth+1);

    printspace(depth);
    printf("-Right: ");
    printpart(root->r, depth+1);
}

void print(node *root) {
    printf("Root: ");
    printpart(root, 1);
}


int main() {
    node *one = create(1);
    node *two = create(2);
    node *three = create(3);
    node *four = create(4);
    node *five = create(5);

    one->l = two;
    one->r = three;
    three->l = four;
    four->r = five;

    print(one);
}

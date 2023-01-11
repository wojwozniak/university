#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define NUM 256

typedef struct node {
    struct node *children[NUM];
    bool wordend;
} node;


node *create() {
    node *newnode = malloc(sizeof *newnode);

    for(int i=0; i<NUM; i++) {
        newnode->children[i] = NULL;
    }

    newnode->wordend = false;
    return newnode;
}

bool insert(node **root, char *text) {
    if(*root == NULL) {
        *root = create();
    }
    node *helper = *root;
    int length = strlen(text);
    for(int i=0; i<length; i++) {
        if(helper->children[text[i]] == NULL) {
            helper->children[text[i]] = create();
        }
        helper = helper->children[text[i]];
    }
    if(helper->wordend) {
        return false;
    } else {
        helper->wordend = true;
        return true;
    }
}

void printpart(node *root, char *history, int length) {
    char newhistory[length+2];
    memcpy(newhistory, history, length);
    newhistory[length+1] = 0;

    if(root->wordend) {
        printf("Slowo: %s\n", history);
    }

    for(int i=0; i<NUM; i++) {
        if(root->children[i] != NULL) {
            newhistory[length] = i;
            printpart(root->children[i], newhistory, length+1);
        }
    }
}

void print(node *root) {
    if(root == NULL) {
        printf("NULL!\n");
        return;
    }
    printpart(root, NULL, 0);
}

int main() {
    node *root = NULL;


}

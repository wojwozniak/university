#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node
{
    int val;
    struct node *l;
    struct node *r;
} node;

// Function to create a new node
node *create(int val)
{
    node *fin = malloc(sizeof(node));
    if (fin != NULL)
    {
        fin->l = NULL;
        fin->r = NULL;
        fin->val = val;
    }
    return fin;
}
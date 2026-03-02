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

// Function inserting a number, return true if inserted, false if already there
bool ins(node **rootptr, int val)
{
    node *root = *rootptr;
    if (root == NULL)
    {
        *rootptr = create(val);
        return true;
    }
    if (val == root->val)
    {
        return false;
    }
    if (val < root->val)
    {
        return ins(&(root->l), val);
    }
    else
    {
        return ins(&(root->r), val);
    }
}

// Function to find minimum value node
node *findMin(node *root)
{
    node *current = root;
    while (current && current->l != NULL)
    {
        current = current->l;
    }
    return current;
}

// Function to delete a node with given value
node *deleteNode(node *root, int val)
{
    if (root == NULL)
    {
        return NULL;
    }

    if (val < root->val)
    {
        root->l = deleteNode(root->l, val);
    }
    else if (val > root->val)
    {
        root->r = deleteNode(root->r, val);
    }
    else
    {
        if (root->l == NULL)
        {
            node *temp = root->r;
            free(root);
            return temp;
        }
        else if (root->r == NULL)
        {
            node *temp = root->l;
            free(root);
            return temp;
        }

        // Node with two children -> we take node with smallest value from right
        // subtree,replace value of current node with it, and call deleteNode on
        // that node
        node *temp = findMin(root->r);
        root->val = temp->val;
        root->r = deleteNode(root->r, temp->val);
    }
    return root;
}

// Function to find successor
int findSuccessor(node *root, int val)
{
    node *current = root;
    node *successor = NULL;

    while (current != NULL)
    {
        if (current->val > val)
        {
            successor = findMin(root->r);
        }
        else if (current->val < val)
        {
            current = current->r;
        }
        else
        {
            break;
        }
    }

    if (successor != NULL)
    {
        return successor->val;
    }

    return -1;
}

// Basic inorder traversal
void inorder(node *root)
{
    if (root != NULL)
    {
        inorder(root->l);
        printf("%d ", root->val);
        inorder(root->r);
    }
}

// Example usage
int main()
{
    node *root = NULL;

    // Test insert
    ins(&root, 500);
    ins(&root, 3001);
    ins(&root, 700);
    ins(&root, 200);
    ins(&root, 400);
    printf("Tree after insertion: ");
    inorder(root);
    printf("\n");

    // Test successor
    int val = 300;
    int successor = findSuccessor(root, val);
    printf("Successor of %d: %d\n", val, successor);

    // Test deletion
    root = deleteNode(root, 300);
    printf("Tree after deleting 300: ");
    inorder(root);
    printf("\n");

    return 0;
}
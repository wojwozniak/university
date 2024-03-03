#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/* Stary kod z kursu C */
/* Rozwiązanie zad1 / L1 od około ~100 linijki */

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

// Function printing indentations (tree structure)
void printspace(int depth)
{
    printf("|");
    for (int i = 0; i < depth - 1; i++)
    {
        printf(" |");
    }
    return;
}

// Recursive function printing every node of three one by one
void printpart(node *root, int depth)
{
    if (root == NULL)
    {
        printf("</> \n");
        return;
    }

    printf("%d \n", root->val);

    printspace(depth);
    printf("-Left: ");
    printpart(root->l, depth + 1);

    printspace(depth);
    printf("-Right: ");
    printpart(root->r, depth + 1);
}

// Function setting indentation and calling first printpart, to be reworked
void print(node *root)
{
    printf("Root: ");
    printpart(root, 1);
}

/* Koniec starego kodu */

// a) Liczymy liczbę wierzchołków w T - prosty algorytm rekurencyjny
int count(node *root)
{
    if (root == NULL)
    {
        return 0;
    }
    return 1 + count(root->l) + count(root->r);
}

// b) Maksymalna odległość między wierzchołkami w T

// Pomocnicza funkcja do wybierania większej z dwóch liczb
int max(int a, int b)
{
    return a > b ? a : b;
}

// Pomocnicza funkcja do wyliczania maksymalnej głębokości od node'a
int max_depth(node *root)
{
    if (root == NULL)
    {
        return 0;
    }
    return 1 + max(max_depth(root->l), max_depth(root->r));
}

int max_distance(node *root)
{
    if (root == NULL)
    {
        return 0;
    }

    /*
        I tu lekko bardziej rozpiszę, bo tu jest mała pułapka.
        Drzewo może być niesymetryczne - wtedy nie możemy po prostu zsumować
        głębokości lewego i prawego poddrzewa.

        Oprócz tego musimy liczyć maksymalną odległość między wierzchołkami w
        poddrzewach, i sprawdzić czy tam coś większego się nie znajdzie.
    */

    // Wyliczamy potrzebne nam wartości
    int max_depth_left = max_depth(root->l);
    int max_depth_right = max_depth(root->r);
    int max_distance_left = max_distance(root->l);
    int max_distance_right = max_distance(root->r);

    // Tu mamy sumę głębokości lewego i prawego poddrzewa
    int sum_of_depths = max_depth_left + max_depth_right;

    // A tu jeszcze max wartości rekurencyjnie dla dzieci
    int max_distance_children = max(max_distance_left, max_distance_right);

    // Zwracamy większą z dwóch wartości
    return max(sum_of_depths, max_distance_children);
}

int main()
{
    // Create an empty root node
    node *root = NULL;

    // Insert values into the binary tree
    ins(&root, 5);
    ins(&root, 3);
    ins(&root, 7);
    ins(&root, 2);
    ins(&root, 4);
    ins(&root, 6);

    print(root);
    printf("zad1 a): %d\n", count(root));

    printf("zad1 b): %d\n", max_distance(root));

    return 0;
}

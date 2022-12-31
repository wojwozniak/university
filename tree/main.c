#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define INT_MIN -2147483648
#define INT_MAX 214783647


typedef struct node {
    int val;
    struct node *l;
    struct node *r;
} node;

// Function to create a new node
node *create(int val) {
    node *fin = malloc(sizeof(node));
    if(fin != NULL) {
        fin->l = NULL;
        fin->r = NULL;
        fin->val = val;
    }
    return fin;
}

// Function printing indentations (tree structure)
void printspace(int depth) {
    printf("|");
    for(int i=0; i<depth-1; i++) {
        printf(" |");
    }
    return;
}

// Recursive function printing every node of three one by one
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

// Function setting indentation and calling first printpart, to be reworked
void print(node *root) {
    printf("Root: ");
    printpart(root, 1);
}

// Function inserting a number, return true if inserted, false if already there
bool ins(node **rootptr, int val) {
    node *root = *rootptr;
    if(root == NULL) {
        *rootptr = create(val);
        return true;
    }
    if(val == root->val) {
        return false;
    }
    if(val < root->val) {
        return ins(&(root->l), val);
    } else {
        return ins(&(root->r), val);
    }
}

// Function checking if number is already in the tree
bool srch(node **rootptr, int val) {
    node *root = *rootptr;
    if(val == root->val) {
        return true;
    }
    if(root == NULL) {
        return false;
    }
    if(val < root->val) {
        return srch(&(root->l), val);
    } else {
        return srch(&(root->r), val);
    }
}

// Helper value for functions below
int help=0;

// Returns smallest value in the tree
int minimum(node **rootptr) {
    node *root = *rootptr;
    if(root == NULL) {
        return help;
    }
    help = root->val;
    minimum(&(root->l));
    }

// Returns biggest value in the tree
int maximum(node **rootptr) {
    node *root = *rootptr;
    if(root == NULL) {
        return help;
    }
    help = root->val;
    maximum(&(root->r));
}

// Helper recursive function looking for next value inside tree
void findnext(node **rootptr, int val) {
    node *root = *rootptr;
    if(root==NULL) {
        return;
    }
    int value = root->val;
    if(value < help && value > val) {
        help = value;
    }
    if(value > val) {
       findnext(&(root->l), val);
    } else {
        findnext(&(root->r), val);
    }
}

// Function returning next value inside tree
int next(node **rootptr, int val) {
    help = INT_MAX;
    findnext(rootptr, val);
    if(help == INT_MAX) {
        printf("BRAK!\n");
    }
    return help;
}

// Helper recursive function looking for previous value inside tree
void findprev(node **rootptr, int val) {
    node *root = *rootptr;
    if(root == NULL) {
        return;
    }
    int value = root->val;
    if(value > help && value < val) {
        help = value;
    }
    if(value >= val) {
        findprev(&(root->l), val);
    } else {
        findprev(&(root->r), val);
    }
}

// Function returning previous value inside tree
int prev(node **rootptr, int val) {
    help = INT_MIN;
    findprev(rootptr, val);
    return help;
}

// Helper function deleting value from tree and moving children' pointers
void deletion(node **rootptr) {
    node *root = *rootptr;
    if(root->l == NULL && root->r == NULL) {
        root = NULL;
        return;
    }
    if(root->l == NULL && root->r != NULL) {
        root = root->r;
        return;
    }
    if(root->l != NULL && root->r == NULL) {
        root = root->l;
        return;
    }
    node *secondchild = root->r;
    root = root->l;
    deletion(&secondchild);
}

// Function deleting a value from tree
bool del(node **rootptr, int val) {
    node *root = *rootptr;
    if(root == NULL) {
        return false;
    }
    if(val == root->val) {
        deletion(&root);
        return true;
    }
    if(val < root->val) {
        del(&(root->l), val);
    }
    if(val > root->val) {
        del(&(root->r), val);
    }
}

int main() {
    printf("Binary Search Tree\n");
    printf("Musimy stworzyc korzen drzewa - podaj wartosc ktora ma sie tam znalezc: ");
    int value;
    scanf("%d", &value);
    node *ftree = create(value);
    printf("Utworzono drzewo! \n");
    while(1) {
        fflush(stdin);
        char a[30] = "";
        char func[10] = "";
        char arg[20] = "";
        printf("\nBinary Search Tree");
        printf("\nMozliwe polecenia: ins X, del X, srch X, min, max, prev X, next X, print, quit");
        printf("\nPodaj polecenie: ");
        fgets(a, 20, stdin);
        if(strncmp(a, "print", 5) == 0) {
            print(ftree);
            printf("Wykonano polecenie!\n");
            continue;
        } else if(strncmp(a,"quit", 4) == 0) {
            return 0;
        } else if (strncmp(a, "max", 3) == 0) {
            int result = maximum(&ftree);
            printf("Najwieksza liczba w drzewie to %d\n", result);
            continue;
        } else if (strncmp(a, "min", 3) == 0) {
            int result = minimum(&ftree);
            printf("Najmniejsza liczba w drzewie to %d\n", result);
            continue;
        }
        int i=0;
        while(a[i]!='\0') {
            if(a[i] == ' ') {
                for(int b=0; b<i; b++) {
                    func[b] = a[b];
                }
                for(int b=i; b<30; b++) {
                    if(a[b]=='\0') {
                        goto here;
                    }
                    arg[b-i-1] = a[b];
                }
            }

            i++;
        }
        here:;
        int carg = atoi(arg);
        printf("Wywolana funkcja: %s z argumentem: %d\n", func, carg);
        if (strncmp(a, "next", 4) == 0) {
            int result = next(&ftree, carg);
            if(result!=INT_MAX) {
                printf("Nastepna liczba w drzewie to %d\n", result);
            } else {
                printf("Nie ma wiekszej liczby w drzewie!\n");
            }
        } else if (strncmp(a, "prev", 4) == 0) {
            int result = prev(&ftree, carg);
            if(result!=INT_MIN) {
               printf("Poprzednia liczba w drzewie to %d\n", result);
            } else {
                printf("Nie ma mniejszej liczby w drzewie!\n");
            }
        } else if (strncmp(a, "ins", 3) == 0) {
            int result = ins(&ftree, carg);
            if(result == 1) {
                printf("Wstawiono liczbe %d do drzewa!\n", carg);
            } else {
                printf("Liczba %d juz znajduje sie w drzewie!\n", carg);
            }
        }  else if (strncmp(a, "srch", 4) == 0) {
            int result = srch(&ftree, carg);
            if(result == 1) {
                printf("Znaleziono liczbe %d w drzewie\n", carg);
            } else {
                printf("Podana liczba nie wystepuje w drzewie!\n");
            }
        } else if (strncmp(a, "del", 3) == 0) {
            int result = del(&ftree, carg);
            if(result == 1) {
                printf("Znaleziono i usunieto liczbe %d!\n", carg);
            } else {
                printf("Podana liczba nie wystepuje w drzewie!\n");
            }
        } else {
            printf("Nie rozpoznano polecenia. Sprobuj jeszcze raz!\n");
        }
    }
}

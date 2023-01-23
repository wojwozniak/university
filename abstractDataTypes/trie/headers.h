#define NUM 128

typedef struct node node;

node *create();
int inserto(node **root, char *text);
void callinsert(node **root, char *text);
void printpart(node *root, char *history, int length);
void print(node *root);
int searcho(node *root, char *text);
void callsearch(node *root, char *text);
void del(node *root);
int parsefile(char text[], node *root);

typedef struct node {
    struct node *children[NUM];
    int wordend;
} node;


node *create() {
    node *newnode = malloc(sizeof *newnode);

    for(int i=0; i<NUM; i++) {
        newnode->children[i] = NULL;
    }

    newnode->wordend = 0;
    return newnode;
}

int inserto(node **root, char *text) {
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
    (helper->wordend)++;
    return helper->wordend;
}

void callinsert(node **root, char *text) {
    int x = inserto(root, text);
    printf("Skutecznie dodano slowo %s, po dodaniu wystepuje ono w drzewie %d razy!\n", text, x);
}

void printpart(node *root, char *history, int length) {
    char newhistory[length+2];
    memcpy(newhistory, history, length);
    newhistory[length+1] = 0;

    if(root->wordend) {
        printf("Slowo %s wystepuje %d razy\n", history, root->wordend);
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

int searcho(node *root, char *text) {
    int length = strlen(text);
    node *helper = root;

    for(int i=0; i<length; i++) {
        if(helper->children[text[i]] == NULL) {
            return 0;
        }
        helper = helper->children[text[i]];
    }
    return helper->wordend;
}

void callsearch(node *root, char *text) {
    int returned = searcho(root, text);
    printf("Znaleziono %d wystapien slowa %s\n", returned, text);
}

void del(node *root) {
    for(int i=0; i<NUM; i++) {
        if(root->children[i] != NULL) {
            del(root->children[i]);
        }
    }
    free(root);
}

int parsefile(char* text, node *root) {
    FILE *textfile = fopen(text, "r");
    if(textfile == NULL) {
        printf("ERROR! Nie mozna otworzyc pliku %s!\n", text);
        return 1;
    }
    char x[1024];

    while(fscanf(textfile, " %1023s", x) == 1) {
        int length = strlen(x);
        int lastchar = (int)x[length-1];
        if(!((lastchar >=65 && lastchar <=90)||(lastchar >=48 && lastchar <=57)||(lastchar >= 97 && lastchar <= 122 )) ) {
            x[length-1] = '\0';
        }
        inserto(root, x);
    }

    fclose(textfile);
    return 0;
}

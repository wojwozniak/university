#include <stdio.h>
#include <stdlib.h>

typedef struct node *pnode;
typedef struct node {
    int val;
    pnode left;
    pnode right;
} snode;

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



int main() {
    return 0;
}

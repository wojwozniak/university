#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "headers.h"
#include "functions.c"

/* Jesli rozszerzymy typ Figura o trapezy musimy:
 - Dodac przynajmniej dwa floaty w ktorych zapiszemy wsp. czwartego wierzcholka
 - Dodac funkcje tworzaca trapez
 - Edytowac funkcje liczace pole, przesuniecie i pokazanie figury
*/

int main() {
    Figura *f1 = new_square(0,4,0,0,0,6);
    show(f1);
    return 0;
}

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
    Figura *f2 = new_square(0,6,0,0,0,6);
    Figura *f3 = new_triangle(0,4,0,0,0,6);
    Figura *f4 = new_triangle(0,4,2,0,0,4);
    Figura *f5 = new_circle(-2,4,2);
    Figura *f6 = new_circle(6,5,3);
    show(f1);
    show(f2);
    show(f3);
    show(f4);
    show(f5);
    show(f6);
    przesun(f6,1.5,-14);
    show(f6);
    Figura *ciag[4];
    ciag[0] = f1;
    ciag[1] = f2;
    ciag[2] = f4;
    ciag[3] = f6;
    printf("%f",sumapol(ciag, 4));
    return 0;
}

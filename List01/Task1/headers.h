/*
Wojciech WoŸniak
Lista 1: zadanie 1
gnu gcc [-std=11]
*/

#define M_PI 3.14159265358979323846

typedef struct Figura Figura;
Figura *setup_fig();
float dl_boku(float x1, float x2, float y1, float y2);
Figura *new_circle(float r, float x, float y);
Figura *new_triangle(float a, float b, float c, float d, float e, float f);
Figura *new_square(float a, float b, float c, float d, float e, float f);
float pole(Figura *f);
void przesun(Figura *f, float x, float y);
void show(Figura *f);
float sumapol(Figura* f[], int size);

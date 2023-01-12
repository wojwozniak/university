#include <stdio.h>
#include <stdlib.h>
#import <stdbool.h>

typedef struct zegar {
    short int g;
    short int m;
    short int s;
}zegar;

struct zegar ustaw(short g, short m, short s);
bool sprawdz(struct zegar z);
struct zegar normuj(struct zegar z);
void dodajgodziny(struct zegar *z, short g);
void dodajminuty(struct zegar *z, short m);
void dodajsekundy(struct zegar *z, short s);
void drukuj(FILE *f, struct zegar z);

int main() {
    zegar z;
    z = ustaw(40,14,2);
    drukuj(stdout, z);
    dodajgodziny(&z, 2);
    drukuj(stdout, z);
    dodajgodziny(&z, -30);
    drukuj(stdout, z);
    dodajminuty(&z, 2137);
    drukuj(stdout, z);
    dodajsekundy(&z, 2137);
    drukuj(stdout, z);
    return 0;
}

struct zegar normuj(struct zegar z) {

    while(z.s < 0) {
        z.m-=1;
        z.s+=60;
    }
    while(z.s >= 60) {
        z.s-=60;
        z.m+=1;
    }
    while(z.m < 0) {
        z.g-=1;
        z.m+=60;
    }
    while(z.m >= 60) {
        z.m-=60;
        z.g+=1;
    }
    while(z.g >= 24) {
        z.g-=24;
    }
    while(z.g < 0) {
        z.g+=24;
    }
    if(sprawdz(z)) {
       return z;
    } else {
        printf("Error!");
    }
};

struct zegar ustaw(short g, short m, short s) {
    zegar z;
    z.g = g;
    z.m = m;
    z.s = s;
    z = normuj(z);
    if(sprawdz(z)) {
       return z;
    } else {
        printf("Error!");
    }
};

bool sprawdz(struct zegar z) {
    if(z.g >= 24 || z.g < 0 || z.m >= 60 || z.m < 0 || z.s >= 60 || z.s < 0) {
        return 0;
    }
    return 1;
};

void dodajgodziny(zegar *z, short g) {
    z->g+=g;
    *z = normuj(*z);
}

void dodajminuty(zegar *z, short m) {
    z->m+=m;
    *z = normuj(*z);
}

void dodajsekundy(zegar *z, short s) {
    z->s+=s;
    *z = normuj(*z);
}

void drukuj(FILE *f, zegar z) {
    fprintf(f, "%02d:%02d:%02d\n", z.g, z.m, z.s);
}


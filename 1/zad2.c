#include <stdio.h>
#include <stdlib.h>

int main() {
    while(1) {
        float xa,ya,xb,yb,xc,yc,xd,yd;
        printf("Podaj po kolei wsporzedne X i Y punktow A,B,C,D (xa, ya, xb, yb...) \n");
        scanf("%f", &xa);
        scanf("%f", &ya);
        scanf("%f", &xb);
        scanf("%f", &yb);
        scanf("%f", &xc);
        scanf("%f", &yc);
        scanf("%f", &xd);
        scanf("%f", &yd);
        if(((xa==xb)&&(ya==yb))||((xc==xd)&&(yc==yd))) {
            printf("Podano odcinek o dlugosci 0! Podaj dlugosci jeszcze raz! \n");
            continue;
        }
        float aj, ad;
        aj = ((ya-yb)/(xa-xb));
        ad = ((yc-yd)/(xc-xd));
        if(aj==ad) {
            printf("rownolegle \n");
        } else if((aj*ad)==-1) {
            printf("prostopadle \n");
        } else  {
            printf("-");
        }
    }
}

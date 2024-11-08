#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(int argc, char *argv[]) {
    if(argc > 2) {
        printf("Za duzo argumentow wywolania!");
        return 1;
    }
    if(argv[1] == NULL || argv[1][0]=='0') {
        printf("Nieprawidlowy argument wywolania!");
        return 1;
    }
    char *arg = argv[1];
    printf("Argument wywolania to: %s\n", arg);
    int argint;
    sscanf(arg, "%d", &argint);
    int input = 0;

    while(1) {
      printf("Podaj liczbe do sprawdzenia podzielnosci (lub lb <=0 aby wyjsc z programu!): ");
      scanf("%d", &input);
      if(input <= 0) {
        printf("Zakonczono dzialanie programu!");
        return 0;
      } else {
          printf("Podano liczbe %d\n", input);
          int b = (arg[strlen(arg)-1])-'0';
          if(!(b == input)) {
            printf("Nie jest podzielnikiem liczby T (kryterium 1)! \n");
            continue;
          }
          int a = floor(argint/10);
          int t = a * 10 + b;
          //printf("%d", t);
          if(t!=argint) {
            printf("Nie jest podzielnikiem liczby T (kryterium 2)! \n");
            continue;
          }
          int k = a%input;
          int x = t%input;
          int y = (k*10 + b)%input;
          if(x!=y) {
            printf("Nie jest podzielnikiem liczby T (kryterium 3)! \n");
            continue;
          }
          printf("Podana liczba jest podzielnikiem liczby T!");
      }
    }
}

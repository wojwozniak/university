#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "exeheader.h"
#include "memoryheader.h"
#include "engineheaders.h"
#include "ramheader.h"
#include "menuheaders.h"
#include "exefunctions.c"
#include "memoryfunctions.c"
#include "enginefunctions.c"
#include "ramfunctions.c"
#include "menufunctions.c"

int main(int argc, char *argv[]) {
    exe *main_tape = create("LOAD", "0", "");
    memory_cell *battery = create_new_cell(NULL);
    engine *main_engine = create_engine(battery);
    char input[20];
    int choice;
    bool status;
    while(1) {
        status = is_engine_on(main_engine);
        printf("==================================\n");
        printf("Symulator maszyny RAM\n");
        if(status) {
            printf("Aktualny status maszyny: natychmiastowe wykonywanie polecen!\n");
        } else {
            printf("Aktualny status maszyny: wylaczona. Zbiera polecenia dopoki jej nie uruchomisz!\n");
        }
        printf("Mozliwe opcje:\n - 0 - Wylacz program\n");
        if(status) {
            printf(" - 1 - Wylacz tryb automatycznego wykonywania polecen\n");
        } else {
            printf(" - 1 - Wlacz tryb automatycznego wykonywania polecen\n");
        }
        printf(" - 2 - Dopisz polecenie do tasmy\n");
        printf(" - 3 - Usun ostatnie polecenie z tasmy\n");
        printf(" - 4 - Wczytaj polecenia z pliku podanego w argumentach wywolania programu\n");
        printf(" - 5 - Wyczysc pamiec - usuwa wszystkie polecenia z tasmy i komorki pamieci!\n");
        printf("Wybierz opcje by kontynuowac: ");
        scanf("%d", &choice);
        switch(choice) {
        case 0:
            printf("Wylaczam program!\n");
            return 0;
        case 1:
            if(status) {
                turn_off_engine(main_engine);
                printf("Wylaczono silnik!\n");
            } else {
                turn_on_engine(main_engine);
                printf("Wlaczono silnik!\n");
            }
            break;
        case 2:
            break;
        case 3:
            if(main_tape->next != NULL) {
                pop_last_exe(main_tape);
                printf("Usunieto ostatnie polecenie z tasmy!\n");
            } else {
                printf("Brak polecen na tasmie!\n");
            }
            break;
        case 4:
            //handleFile();
            break;
        case 5:
            clearMemory(main_tape, battery);
            printf("Wyczyszczono pamiec!\n");
            break;
        default:
            printf("Nie rozpoznano polecenia - sprobuj podac je ponownie!\n");
            continue;
        }
        status = is_engine_on(main_engine);
        unsigned int last_id = get_end_of_tape(main_tape);
        while(status) {
            if(main_engine->amount_of_exes < last_id) {
              engine_cycle(main_engine, main_tape);
            } else {
                break;
            }
        }
    }
}

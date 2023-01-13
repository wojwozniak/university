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
    exe *output = create("", "", "");
    exe *input = create("", "", "");
    engine *main_engine = create_engine(battery, output, main_tape, input);
    int choice;
    bool status;
    while(1) {
        status = is_engine_on(main_engine);
        printf("=================================================================================\n");
        printf("Symulator maszyny RAM\n");
        if(status) {
            printf("Aktualny status maszyny: natychmiastowe wykonywanie polecen!\n");
        } else {
            printf("Aktualny status maszyny: wylaczona. Zbiera polecenia dopoki jej nie uruchomisz!\n");
        }
        printf("---------------------------------------------------------------------------------\n");
        printf("Mozliwe opcje:\n - 0 - Wylacz program\n");
        if(status) {
            printf(" - 1 - Wylacz tryb automatycznego wykonywania polecen\n");
        } else {
            printf(" - 1 - Wlacz tryb automatycznego wykonywania polecen\n");
        }
        printf(" - 2 - Dopisz polecenie do tasmy\n");
        printf(" - 3 - Usun ostatnie polecenie z tasmy\n");
        printf(" - 4 - Wypisz wszystkie polecenia z tasmy polecen\n");
        printf(" - 5 - Wyczysc pamiec - usuwa wszystkie polecenia z tasmy i komorki pamieci!\n");
        printf(" - 6 - Wypisz zawartosc tasmy wejsciowej!\n");
        printf(" - 7 - Wypisz zawartosc tasmy wynikowej!\n");
        printf(" - 8 - Wypisz zawartosc wszystkich zaincjalizowanych komorek pamieci!\n");
        printf("---------------------------------------------------------------------------------\n");
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
            printf("Mozliwe komendy:\n");
            printf("HALT, READ, LOAD, STORE, ADD, SUB, MULT, DIV, JUMP, JGTZ, JZERO, WRITE\n");
            printf("Wpisz komende (bez argumentu!): ");
            char command[6];
            char payload[10];
            char marker[10];
            fflush(stdin);
            scanf("%s", &command);
            printf("Podano polecenie %s\n", command);
            printf("Podaj marker (do 5 liter) (podaj 0 jesli nie chcesz ustawiac zadnego markera): ");
            fflush(stdin);
            scanf("%s", &marker);
            if(strcmp(marker, "0") == 0) {
                marker[0] = '\0';
            } else {
                printf("Podano marker %s\n", marker);
            }
            if(strcasecmp(command, "HALT") == 0) {
                attach_to_end(main_tape, "HALT", "", marker);
                printf("Dodano polecenie do tasmy!\n");
                break;
            } else if (strcasecmp(command, "READ") == 0) {
                attach_to_end(main_tape, "READ", payload, marker);
                printf("Dodano polecenie do tasmy!\n");
            } else {
                printf("Podaj argument polecenia: ");
                scanf("%s", &payload);
                printf("Podano argument %s\n", payload);
                printf("Pelne polecenie: %s %s , marker %s , zapisuje na tasmie!\n", command, payload, marker);
                if(strcasecmp(command, "LOAD") == 0) {
                    attach_to_end(main_tape, "LOAD", payload, marker);
                    printf("Dopisano LOAD do tasmy!\n");
                } else if(strcasecmp(command, "STORE") == 0) {
                    attach_to_end(main_tape, "STORE", payload, marker);
                    printf("Dopisano STORE do tasmy!\n");
                } else if(strcasecmp(command, "ADD") == 0) {
                    attach_to_end(main_tape, "ADD", payload, marker);
                    printf("Dopisano ADD do tasmy!\n");
                } else if(strcasecmp(command, "SUB") == 0) {
                    attach_to_end(main_tape, "SUB", payload, marker);
                    printf("Dopisano SUB do tasmy!\n");
                } else if(strcasecmp(command, "MULT") == 0) {
                    attach_to_end(main_tape, "MULT", payload, marker);
                    printf("Dopisano MULT do tasmy!\n");
                } else if(strcasecmp(command, "DIV") == 0) {
                    attach_to_end(main_tape, "DIV", payload, marker);
                    printf("Dopisano DIV do tasmy!\n");
                } else if(strcasecmp(command, "JUMP") == 0) {
                    attach_to_end(main_tape, "JUMP", payload, marker);
                    printf("Dopisano JUMP do tasmy\n");
                } else if(strcasecmp(command, "JZERO") == 0) {
                    attach_to_end(main_tape, "JZERO", payload, marker);
                    printf("Dopisano JZERO do tasmy\n");
                } else if(strcasecmp(command, "WRITE") == 0) {
                    attach_to_end(main_tape, "WRITE", payload, marker);
                    printf("Dopisano WRITE do tasmy\n");
                } else if(strcasecmp(command, "JGTZ") == 0) {
                    attach_to_end(main_tape, "JGTZ", payload, marker);
                    printf("Dopisano JGTZ do tasmy\n");
                } else {
                    printf("Nie rozpoznano polecenia! Sprobuj jeszcze raz!\n");
                }
                break;
            }
        case 3:
            if(main_tape->next != NULL) {
                pop_last_exe(main_tape);
                printf("Usunieto ostatnie polecenie z tasmy!\n");
            } else {
                printf("Brak polecen na tasmie!\n");
            }
            break;
        case 4:
            printf("Wypisywanie wszystkich polecen!\n");
            print_all_exes(main_tape, true);
            printf("Wypisano!\n");
            break;
        case 5:
            clearMemory(main_tape, battery);
            printf("Wyczyszczono pamiec!\n");
            break;
        case 6:
            printf("Wypisywanie inputu!\n");
            print_all_exes(input, true);
            printf("Koniec inputu!\n");
            break;
        case 7:
            printf("Wypisywanie outputu!\n");
            print_all_exes(output, true);
            printf("Koniec outputu!\n");
            break;
        case 8:
            printf("Wypisuje zawartosc wszystkich zainicjalizowanych komorek!\n");
            print_all_cells(battery);
            printf("Koniec!\n");
            break;
        default:
            printf("Nie rozpoznano polecenia - sprobuj podac je ponownie!\n");
            continue;
        }
        status = is_engine_on(main_engine);
        unsigned int last_id = get_end_of_tape(main_tape)->command_id;
        while(status) {
            if(main_engine->amount_of_exes < last_id) {
                printf("Silnik wykonuje polecenie nr %d\n", main_engine->amount_of_exes+1);
                printf("---------------------------------------------------------------------------------\n");
                engine_cycle(main_engine, main_tape);
                printf("---------------------------------------------------------------------------------\n");
            } else {
                break;
            }
            if(main_engine->turning_off) {
                printf("Maszyna sie wylacza wiec wypisuje output!\n");
                print_all_exes(output, true);
                printf("Koniec outputu!\n");
                return 0;
            }
        }
    }
}

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
    while(1) {
        handleMenu(main_engine, argc, argv);
        unsigned int last_id = get_end_of_tape(main_tape)->command_id;
        while(is_engine_on(main_engine)) {
            if(main_engine->amount_of_exes < last_id) {
                printf("Silnik wykonuje polecenie nr %d\n", main_engine->amount_of_exes+1);
                printf("---------------------------------------------------------------------------------\n");
                engine_cycle(main_engine, main_tape);
                printf("---------------------------------------------------------------------------------\n");
            } else {
                break;
            }
            if(main_engine->turning_off) {
                printf("Maszyna sie wylacza, wypisuje output!\n");
                print_all_exes(output, true);
                printf("Koniec outputu!\n");
                return 0;
            }
        }
    }
}

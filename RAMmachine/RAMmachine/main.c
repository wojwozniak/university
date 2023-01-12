#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "exeheader.h"
#include "exefunctions.c"
#include "memoryheader.h"
#include "memoryfunctions.c"
#include "engineheaders.h"
#include "enginefunctions.c"

int main() {
    exe *main_tape = create("LOAD", "0", "");
    memory_cell *battery = create_new_cell(NULL);
    engine *main_engine = create_engine(battery);
}

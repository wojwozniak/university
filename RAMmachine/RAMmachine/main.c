#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "exeheader.h"
#include "memoryheader.h"
#include "engineheaders.h"
#include "ramheader.h"
#include "exefunctions.c"
#include "memoryfunctions.c"
#include "enginefunctions.c"
#include "ramfunctions.c"

int main() {
    exe *main_tape = create("LOAD", "0", "");
    memory_cell *battery = create_new_cell(NULL);
    engine *main_engine = create_engine(battery);
}

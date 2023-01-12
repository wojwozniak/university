#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "exeheader.h"
#include "exefunctions.c"
#include "memoryheader.h"
#include "memoryfunctions.c"
#include "engineheaders.h"
#include "enginefunctions.c"

int main() {
    exe *main = create("LOAD", "0", NULL);
    memory_cell *battery = create_new_cell(NULL);
    engine *main_engine = create_engine(battery);
}

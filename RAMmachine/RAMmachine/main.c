#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct exe {
    unsigned int command_id;
    char *command;
    char *payload;
    char *marker;
    struct exe *prev;
    struct exe *next;
} exe;

// Create tape
exe *create(char *command, char *payload, char *marker) {
    exe *output = malloc(sizeof(exe));
    if(output!=NULL) {
        output->command = command;
        output->payload = payload;
        output->marker = marker;
        output->prev = NULL;
        output->next = NULL;
        output->command_id = NULL;
    }
    return output;
}

exe *get_end_of_tape(exe *tape) {
    if(tape->next == NULL) {
        return tape;
    }
    get_end_of_tape(tape->next);
}

exe *attach_to_end(exe *tape, char *command, char *payload, char *marker) {
    exe *output = create(command, payload, marker);
    exe *end_of_tape = get_end_of_tape(tape);
    output->prev = end_of_tape;
    output->command_id = end_of_tape->command_id + 1;
    end_of_tape->next = output;
    return output;
}

exe *find_exe_with_id(exe *tape, unsigned int id) {
    if(tape == NULL) {
        return NULL;
    }
    if(tape->command_id == id) {
        return tape;
    } else if(tape->command_id > id) {
        find_exe_with_id(tape->prev, id);
    } else {
        find_exe_with_id(tape->next, id);
    }
}

void *pop_last_exe(exe *tape) {
    exe *end_of_tape = get_end_of_tape(tape);
    exe *new_end_of_tape = end_of_tape->prev;
    new_end_of_tape->next = NULL;
    free(end_of_tape);
}

typedef struct memory_cell {
    unsigned int id;
    int value;
    struct memory_cell *prev;
    struct memory_cell *next;
} memory_cell;

memory_cell *get_last_cell(memory_cell *battery) {
    if(battery->next == NULL) {
        return battery;
    }
    get_last_cell(battery->next);
}

memory_cell *create_new_cell(memory_cell *battery) {
    memory_cell *output = malloc(sizeof(memory_cell));
    unsigned int new_id;
    memory_cell *prev = NULL;
    if(battery != NULL) {
        memory_cell *last_cell = get_last_cell(battery);
        new_id = last_cell->id + 1;
        prev = get_last_cell(battery);
    } else {
        new_id = 0;
    }
    if(output != NULL) {
        output->id = new_id;
        output->value = NULL;
        output->prev = prev;
        output->next = NULL;
    }
    return output;
}

typedef struct engine {
    bool turned_on;
    struct memory_cell *battery;
    unsigned int amount_of_exes;
} engine;

engine *create_engine(memory_cell *battery) {
    engine *output = malloc(sizeof(engine));
    if(output != NULL) {
        output->turned_on = false;
        output->battery = battery;
        output->amount_of_exes = 0;
    }
    return battery;
}

void turn_on_engine(engine *engine) {
    engine->turned_on = true;
}

void turn_off_engine(engine *engine) {
    engine->turned_on = false;
}

void engine_cycle(engine *engine, exe *tape) {
    int current_exe_id = engine->amount_of_exes + 1;
    exe *current_task = find_exe_with_id(tape, current_exe_id);
    char *command = current_task->command;
    char *payload = current_task->payload;
    engine->amount_of_exes+=1;
    return;
}

int main() {
    exe *main = create("LOAD", "0", NULL);
    memory_cell *battery = create_new_cell(NULL);
    engine *main_engine = create_engine(battery);
}

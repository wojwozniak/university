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

// Get end of a given tape
exe *get_end_of_tape(exe *tape) {
    if(tape->next == NULL) {
        return tape;
    }
    get_end_of_tape(tape->next);
}

// Create an exe and attach it to end of a given tape
exe *attach_to_end(exe *tape, char *command, char *payload, char *marker) {
    exe *output = create(command, payload, marker);
    exe *end_of_tape = get_end_of_tape(tape);
    output->prev = end_of_tape;
    output->command_id = end_of_tape->command_id + 1;
    end_of_tape->next = output;
    return output;
}

// Find an exe on a given tape with id
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

//Find exe on a given tape by passing a marker
exe *find_exe_with_marker(exe *tape, char *marker) {
    if(tape == NULL) {
        return NULL;
    }
    if(marker == tape->marker) {
        return tape;
    }
    find_exe_with_marker(tape->next, marker);
}

//Delete last exe on an given tape
void *pop_last_exe(exe *tape) {
    exe *end_of_tape = get_end_of_tape(tape);
    exe *new_end_of_tape = end_of_tape->prev;
    new_end_of_tape->next = NULL;
    free(end_of_tape);
}

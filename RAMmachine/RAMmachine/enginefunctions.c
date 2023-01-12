typedef struct engine {
    bool turned_on;
    struct memory_cell *battery;
    unsigned int amount_of_exes;
    bool turning_off;
    struct exe *input_roll;
    struct exe *output_roll;
    struct exe *tape;
} engine;

// Create new engine and attach battery to it
engine *create_engine(memory_cell *battery, exe *output_roll, exe *tape, exe *input) {
    engine *output = malloc(sizeof(engine));
    if(output != NULL) {
        output->turned_on = false;
        output->battery = battery;
        output->amount_of_exes = 0;
        output->turning_off = false;
        output->output_roll = output_roll;
        output->input_roll = input;
        output->tape = tape;
    }
    return output;
}

// Turn on engine
void turn_on_engine(engine *engine) {
    engine->turned_on = true;
}

// Turn off engine
void turn_off_engine(engine *engine) {
    engine->turned_on = false;
}

// Check if engine is turned on
bool is_engine_on(engine *engine) {
    return engine->turned_on;
}

void execute_command(engine *engine, char command[6], char payload[10]) {
    if(strcmp(command, "LOAD") == 0) {
        ram_load(engine, payload);
        return;
    }
    if(strcmp(command, "STORE") == 0) {
        ram_store(engine, payload);
        return;
    }
    if(strcmp(command, "ADD") == 0) {
        ram_add(engine, payload);
        return;
    }
    if(strcmp(command, "SUB") == 0) {
        ram_sub(engine, payload);
        return;
    }
    if(strcmp(command, "MULT") == 0) {
        ram_mult(engine, payload);
        return;
    }
    if(strcmp(command, "DIV") == 0) {
        ram_div(engine, payload);
        return;
    }
    if(strcmp(command, "JUMP") == 0) {
        ram_jump(engine, payload);
        return;
    }
    if(strcmp(command, "JZERO") == 0) {
        ram_jzero(engine, payload);
        return;
    }
    if(strcmp(command, "JGTZ") == 0) {
        ram_jgtz(engine, payload);
        return;
    }
    if(strcmp(command, "READ") == 0) {
        ram_read(engine, payload);
        return;
    }
    if(strcmp(command, "WRITE") == 0) {
        ram_write(engine, payload);
        return;
    }
    if(strcmp(command, "HALT") == 0) {
        ram_halt(engine, payload);
        return;
    }

}

// Run single engine cycle with a tape
void engine_cycle(engine *engine, exe *tape) {
    int current_exe_id = engine->amount_of_exes + 1;
    exe *end_of_tape = get_end_of_tape(tape);
    exe *current_task = find_exe_with_id(end_of_tape, current_exe_id);
    //printf("Znaleziono zadanie!: id aktualnego zadania: %d\n", current_task->command_id);
    char command[6];
    strcpy(command, current_task->command);
    char payload[10];
    strcpy(payload, current_task->payload);
    execute_command(engine, command, payload);
    engine->amount_of_exes+=1;
    return;
}

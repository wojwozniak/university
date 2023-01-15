void clearMemory(exe *tape, memory_cell *battery) {
    while(battery->next != NULL) {
        pop_last_cell(battery);
    }
    while(tape->next != NULL) {
        pop_last_exe(tape);
    }
    return;
}

int checkIfArgv(int argc) {
    if(argc <= 2) {
        return 0;
    } else {
        return argc-2;
    }
}

bool readfile(char filename[100], exe *input_tape) {
    FILE *textfile = fopen(filename, "r");
    if(textfile == NULL) {
        printf("ERROR! Nie mozna otworzyc pliku %s!\n", filename);
        return 1;
    }
    char x[10];
    while(fscanf(textfile, " %9s", x) == 1) {
        attach_to_end(input_tape, "", x, "");
    }
    return 0;
}

bool write_output(char filename[100], exe *output_tape) {
    FILE *textfile = fopen(filename, "w");
    if(textfile == NULL) {
        printf("ERROR! Nie mozna otworzyc pliku %s!\n", filename);
        return 1;
    } else {
        while(output_tape!=NULL) {
            fprintf(textfile, output_tape->payload);
            fprintf(textfile, "\n");
            output_tape = output_tape->next;
        }
        fclose(textfile);
    }
    return 0;
}

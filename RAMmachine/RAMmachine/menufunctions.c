void clearMemory(exe *tape, memory_cell *battery) {
    while(battery->next != NULL) {
        pop_last_cell(battery);
    }
    while(main_tape->next != NULL) {
        pop_last_exe(tape);
    }
    return;
}

void handleFile(exe *tape, char path[20]) {
    return;
}


void clearMemory(exe *tape, memory_cell *battery) {
    while(battery->next != NULL) {
        pop_last_cell(battery);
    }
    while(tape->next != NULL) {
        pop_last_exe(tape);
    }
    return;
}

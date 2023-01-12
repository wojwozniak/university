typedef struct memory_cell {
    unsigned int id;
    int value;
    struct memory_cell *prev;
    struct memory_cell *next;
} memory_cell;

// Get last cell by giving first battery
memory_cell *get_last_cell(memory_cell *battery) {
    if(battery->next == NULL) {
        return battery;
    }
    get_last_cell(battery->next);
}

// Create new cell (you can pass battery to automatically attach new cell to the end of it)
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

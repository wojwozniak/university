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
        last_cell->next = output;
    } else {
        new_id = 0;
    }
    if(output != NULL) {
        output->id = new_id;
        output->value = 0;
        output->prev = prev;
        output->next = NULL;
    }
    return output;
}

memory_cell *create_up_to_id_and_return_cell(memory_cell *battery, unsigned int id) {
    unsigned int current_last_id = get_last_cell(battery)->id;
    memory_cell *output;
    while(current_last_id < id) {
        output = create_new_cell(output);
        current_last_id+=1;
    }
    return output;
}

memory_cell *get_cell_with_id(memory_cell *battery, unsigned int id) {
    memory_cell *output;
    if(battery->id == id) {
        return battery;
    } else if(battery->next == NULL) {
        output = create_up_to_id_and_return_cell(battery, id);
        return output;
    }
    get_cell_with_id(battery->next, id);
}

void pop_last_cell(memory_cell *battery) {
    if(battery == NULL) {
        return;
    } else if (battery->next == NULL) {
        free(battery);
    }
    pop_last_cell(battery->next);
}

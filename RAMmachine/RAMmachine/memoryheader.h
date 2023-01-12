typedef struct memory_cell memory_cell;

memory_cell *get_last_cell(memory_cell *battery);
memory_cell *create_new_cell(memory_cell *battery);
memory_cell *create_up_to_id_and_return_cell(memory_cell *battery, unsigned int id);

typedef struct exe exe;

exe *create(char command[6], char payload[10], char marker[10]);
exe *get_end_of_tape(exe *tape);
exe *attach_to_end(exe *tape, char command[6], char payload[10], char marker[10]);
exe *find_exe_with_id(exe *tape, unsigned int id);
exe *find_exe_with_marker(exe *tape, char marker[10]);
void *pop_last_exe(exe *tape);
void print_all_exes(exe *tape, bool ignore_head_ptr);

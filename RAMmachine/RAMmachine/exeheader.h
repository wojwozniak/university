typedef struct exe exe;

exe *create(char *command, char *payload, char *marker);
exe *get_end_of_tape(exe *tape);
exe *attach_to_end(exe *tape, char *command, char *payload, char *marker);
exe *find_exe_with_id(exe *tape, unsigned int id);
exe *find_exe_with_marker(exe *tape, char *marker);
void *pop_last_exe(exe *tape);

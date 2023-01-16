void clearMemory(exe *tape, memory_cell *battery);
int checkIfArgv(int argc);
bool readfile(char filename[100], exe *input_tape);
bool write_output(char filename[100], exe *output_tape);
void handleMenu(engine *main_engine, int argC, char *argv[]);

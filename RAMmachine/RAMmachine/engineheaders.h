typedef struct engine engine;

engine *create_engine(memory_cell *battery);
void turn_on_engine(engine *engine);
void engine_cycle(engine *engine, exe *tape);
bool is_engine_on(engine *engine);
void execute_command(engine *engine, char command[6], char payload[10]);

void ram_load(engine *engine, char payload[10]) {
    printf("Wykonywanie funkcji LOAD z argumentem %s\n", payload);
    int first = (int)payload[0];
    if(!((first == 94)||(first >= 48 && first <= 57)||(first == 61))) {
        printf("Zly argument dla funkcji LOAD!\n");
    }
    else if (first == 61) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        engine->battery->value = command;
        printf("Wczytano liczbe %d do akumulatora \n", command);
    }
    else if (first >= 48 && first <= 57) {
        int command = atoi(payload);
        engine->battery->value = get_cell_with_id(engine->battery, command)->value;
        printf("Wczytano zawartosc komorki %d do akumulatora \n", command);
    } else {
        char command_value[9];
            for(int i=0; i<8; i++) {
                command_value[i] = payload[i+1];
            }
        int command = atoi(command_value);
        memory_cell *helper = get_cell_with_id(engine->battery, command);
        memory_cell *second = get_cell_with_id(engine->battery, helper->value);
        engine->battery->value = second->value;
    }
    return;
}

void ram_store(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia STORE z argumentem %s\n", payload);
    int first = (int)payload[0];
    if (first >=48 && first <= 57) {
        int command = atoi(payload);
        int stored = engine->battery->value;
        memory_cell *help = get_cell_with_id(engine->battery, command);
        help->value = stored;
        printf("Zapisano liczbe %d w komorce nr %d\n", stored, command);
        return;
    } else if (first == 94) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        int stored = engine->battery->value;
        memory_cell *help = get_cell_with_id(engine->battery, command);
        memory_cell *help2 = get_cell_with_id(engine->battery, help->value);
        printf("Zapisano liczbe %d w komorce nr %d (wskazywala na nia zawartosc komorki %d)\n", stored, help2->id, help->id);
    } else {
        printf("Zly argument dla funkcji STORE!\n");
    }
    return;

}

void ram_add(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia ADD z argumentem %s\n", payload);
    int first = (int)payload[0];
    if(first == 61) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        engine->battery->value += command;
        printf("Dodano liczbe %d do akumulatora!\n");
    }
    return;
}

void ram_sub(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia SUB z argumentem %s\n", payload);
}

void ram_mult(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia MULT z argumentem %s\n", payload);

}

void ram_div(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia DIV z argumentem %s\n", payload);

}

void ram_jump(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia JUMP z argumentem %s\n", payload);

}

void ram_jzero(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia JZERO z argumentem %s\n", payload);

}

void ram_jgtz(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia JGTZ z argumentem %s\n", payload);

}

void ram_read(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia READ z argumentem %s\n", payload);

}

void ram_write(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia WRITE z argumentem %s\n", payload);

}

void ram_halt(engine *engine, char payload[10]) {
    printf("Wykonuje polecenie HALT! \n");
    turn_off_engine(engine);
    engine->turning_off = true;
    return;
}

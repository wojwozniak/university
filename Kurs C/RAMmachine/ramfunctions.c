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
        return;
    }
    engine->battery->value = 0;
    return;

}

void ram_add(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia ADD z argumentem %s\n", payload);
    int first = (int)payload[0];
    //printf("%d\n", first);
    if(first == 61) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        engine->battery->value += command;
        printf("Dodano liczbe %d do akumulatora, aktualna wartosc w akumulatorze %d\n", command, engine->battery->value);
    } else if (first >=48 && first <= 57) {
        int command = atoi(payload);
        memory_cell *help  = get_cell_with_id(engine->battery, command);
        int helper = help->value;
        engine->battery->value += helper;
        printf("Dodano liczbe %d do akumulatora. Zrodlo to komorka nr %d, aktualna wartosc w akumulatorze %d\n", helper, help->id, engine->battery->value);
    } else if (first == 94) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        memory_cell *helper = get_cell_with_id(engine->battery, command);
        memory_cell *helper2 = get_cell_with_id(engine->battery, helper->value);
        engine->battery->value += helper2->value;
        printf("Dodano liczbe %d do akumulatora. Zrodlo to komorka nr %d, wskazala na nia komorka nr %d. Aktualna wartosc w akumulatorze to %d\n", helper2->value, helper2->id, helper->id, engine->battery->value);
    } else {
        printf("Zly argument dla funkcji ADD!\n");
    }
    return;
}

void ram_sub(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia SUB z argumentem %s\n", payload);
    int first = (int)payload[0];
    if(first == 61) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        engine->battery->value -= command;
        printf("Odjeto liczbe %d od akumulatora, aktualna wartosc w akumulatorze %d\n", command, engine->battery->value);
    } else if (first >=48 && first <= 57) {
        int command = atoi(payload);
        memory_cell *help  = get_cell_with_id(engine->battery, command);
        int helper = help->value;
        engine->battery->value -= helper;
        printf("Odjeto liczbe %d do akumulatora. Zrodlo to komorka nr %d, aktualna wartosc w akumulatorze %d\n", helper, help->id, engine->battery->value);
    } else if (first == 94) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        memory_cell *helper = get_cell_with_id(engine->battery, command);
        memory_cell *helper2 = get_cell_with_id(engine->battery, helper->value);
        engine->battery->value -= helper2->value;
        printf("Odjeto liczbe %d od akumulatora. Zrodlo to komorka nr %d, wskazala na nia komorka nr %d. Aktualna wartosc w akumulatorze to %d\n", helper2->value, helper2->id, helper->id, engine->battery->value);
    } else {
        printf("Zly argument dla funkcji SUB!\n");
    }
    return;
}

void ram_mult(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia MULT z argumentem %s\n", payload);
    int first = (int)payload[0];
    if(first == 61) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        engine->battery->value *= command;
        printf("Wymnozono liczbe %d przez zawartosc akumulatora, aktualna wartosc w akumulatorze %d\n", command, engine->battery->value);
    } else if (first >=48 && first <= 57) {
        int command = atoi(payload);
        memory_cell *help  = get_cell_with_id(engine->battery, command);
        int helper = help->value;
        engine->battery->value *= helper;
        printf("Wymnozono liczbe %d przez zawartosc akumulatora. Zrodlo to komorka nr %d, aktualna wartosc w akumulatorze %d\n", helper, help->id, engine->battery->value);
    } else if (first == 94) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        memory_cell *helper = get_cell_with_id(engine->battery, command);
        memory_cell *helper2 = get_cell_with_id(engine->battery, helper->value);
        engine->battery->value *= helper2->value;
        printf("Wymnozono liczbe %d przez zawartosc akumulatora. Zrodlo to komorka nr %d, wskazala na nia komorka nr %d. Aktualna wartosc w akumulatorze to %d\n", helper2->value, helper2->id, helper->id, engine->battery->value);
    } else {
        printf("Zly argument dla funkcji MULT!\n");
    }
    return;

}

void ram_div(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia DIV z argumentem %s\n", payload);
    int first = (int)payload[0];
    if(first == 61) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        engine->battery->value /= command;
        printf("Przedzielono zawartosc akumulatora przez liczbe %d, aktualna wartosc w akumulatorze %d\n", command, engine->battery->value);
    } else if (first >=48 && first <= 57) {
        int command = atoi(payload);
        memory_cell *help  = get_cell_with_id(engine->battery, command);
        int helper = help->value;
        engine->battery->value /= helper;
        printf("Przedzielono zawartosc akumulatora przez liczbe %d. Zrodlo to komorka nr %d, aktualna wartosc w akumulatorze %d\n", helper, help->id, engine->battery->value);
    } else if (first == 94) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        memory_cell *helper = get_cell_with_id(engine->battery, command);
        memory_cell *helper2 = get_cell_with_id(engine->battery, helper->value);
        engine->battery->value /= helper2->value;
        printf("Przedzielono zawartosc akumulatora przez liczbe %d. Zrodlo to komorka nr %d, wskazala na nia komorka nr %d. Aktualna wartosc w akumulatorze to %d\n", helper2->value, helper2->id, helper->id, engine->battery->value);
    } else {
        printf("Zly argument dla funkcji DIV!\n");
    }
    return;

}

void ram_jump(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia JUMP z argumentem %s\n", payload);
    exe *tape = get_end_of_tape(engine->tape);
    exe *found = find_exe_with_marker(tape, payload);
    if(found == NULL) {
        printf("Nie mozna wykonac skoku - nie znaleziono takiego markera!\n");
    } else {
        int id = found->command_id;
        engine->amount_of_exes = id;
        printf("Wykonano skok do nr %d\n", id);
    }
    return;
}

void ram_jzero(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia JZERO z argumentem %s\n", payload);
    if(engine->battery->value == 0) {
        printf("Zawartosc akumulatora wynosi 0, mozna wykonac skok! \n");
        exe *tape = get_end_of_tape(engine->tape);
        exe *found = find_exe_with_marker(tape, payload);
        if(found == NULL) {
            printf("Nie mozna wykonac skoku - nie znaleziono takiego markera!\n");
        } else {
            int id = found->command_id;
            engine->amount_of_exes = id;
            printf("Wykonano skok do nr %d\n", id);
        }
    } else {
        printf("Zawartosc akumulatora to %d, nie mozna wykonac skoku!\n", engine->battery->value);
    }
    return;
}

void ram_jgtz(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia JGTZ z argumentem %s\n", payload);
    if(engine->battery->value > 0) {
        printf("Zawartosc akumulatora > 0 (konkretniej %d), mozna wykonac skok! \n", engine->battery->value);
        exe *tape = get_end_of_tape(engine->tape);
        exe *found = find_exe_with_marker(tape, payload);
        if(found == NULL) {
            printf("Nie mozna wykonac skoku - nie znaleziono takiego markera!\n");
        } else {
            int id = found->command_id;
            engine->amount_of_exes = id;
            printf("Wykonano skok do nr %d\n", id);
        }
    } else {
        printf("Zawartosc akumulatora to %d, nie mozna wykonac skoku!\n", engine->battery->value);
    }
    return;
}

void ram_read(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia READ\n");
    exe *input_roll = engine->input_roll;
    int x = atoi(input_roll->command);
    engine->battery->value = x;
    engine->input_roll = input_roll->next;
    return;
}

void ram_write(engine *engine, char payload[10]) {
    printf("Wykonywanie polecenia WRITE z argumentem %s\n", payload);
    exe *output_roll = engine->output_roll;
    char to_e[10];
    int first = (int)payload[0];
    if(first == 61) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        strcpy(to_e, command_value);
        attach_to_end(output_roll, "", to_e, "");
        printf("Zapisano %s w komorce nr %d outputu!\n", command_value, get_end_of_tape(output_roll)->command_id);
    } else if (first == 94) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        memory_cell *helper = get_cell_with_id(engine->battery, command);
        memory_cell *helper2 = get_cell_with_id(engine->battery, helper->value);
        char out[10];
        itoa(helper2->value, out, 10);
        strcpy(to_e, out);
        attach_to_end(output_roll, "", to_e, "");
        printf("Zapisano %s w komorce nr %d outputu!\n", out, get_end_of_tape(output_roll)->command_id);
    } else if (first >=48 && first <= 57) {
        char command_value[9];
        for(int i=0; i<8; i++) {
            command_value[i] = payload[i+1];
        }
        int command = atoi(command_value);
        memory_cell *helper = get_cell_with_id(engine->battery, command);
        char out[10];
        itoa(helper->value, out, 10);
        strcpy(to_e, out);
        attach_to_end(output_roll, "", to_e, "");
        printf("Zapisano %s w komorce nr %d outputu!\n", out, get_end_of_tape(output_roll)->command_id);
    } else {
        printf("Wrong argument for function WRITE!\n");
        return;
    }
    engine->output_roll = engine->output_roll->next;
    return;
}

void ram_halt(engine *engine, char payload[10]) {
    printf("Wykonuje polecenie HALT! \n");
    turn_off_engine(engine);
    engine->turning_off = true;
    return;
}

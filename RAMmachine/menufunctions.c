void clearMemory(exe *tape, memory_cell *battery) {
    while(battery->next != NULL) {
        pop_last_cell(battery);
    }
    while(tape->next != NULL) {
        pop_last_exe(tape);
    }
    return;
}

int checkIfArgv(int argc) {
    if(argc <= 2) {
        return 0;
    } else {
        return argc-2;
    }
}

bool readfile(char filename[100], exe *input_tape) {
    FILE *textfile = fopen(filename, "r");
    if(textfile == NULL) {
        printf("ERROR! Nie mozna otworzyc pliku %s!\n", filename);
        return 1;
    }
    char x[10];
    while(fscanf(textfile, " %9s", x) == 1) {
        attach_to_end(input_tape, "", x, "");
    }
    return 0;
}

bool write_output(char filename[100], exe *output_tape) {
    FILE *textfile = fopen(filename, "w");
    if(textfile == NULL) {
        printf("ERROR! Nie mozna otworzyc pliku %s!\n", filename);
        return 1;
    } else {
        while(output_tape!=NULL) {
            fprintf(textfile, output_tape->payload);
            fprintf(textfile, "\n");
            output_tape = output_tape->next;
        }
        fclose(textfile);
    }
    return 0;
}

void handleMenu(engine *main_engine, int argc, char *argv[]) {
    int choice;
    bool choice2;
    bool status = is_engine_on(main_engine);
    exe *main_tape = main_engine->tape;
    exe *input = main_engine->input_roll;
    exe *output = main_engine->output_roll;
    memory_cell *battery = main_engine->battery;
    printf("=================================================================================\n");
    printf("Symulator maszyny RAM\n");
    if(status) {
        printf("Aktualny status maszyny: natychmiastowe wykonywanie polecen!\n");
    } else {
        printf("Aktualny status maszyny: wylaczona. Zbiera polecenia dopoki jej nie uruchomisz!\n");
    }
    printf("---------------------------------------------------------------------------------\n");
    printf("Mozliwe opcje:\n - 0 - Wylacz program\n");
    if(status) {
        printf(" - 1 - Wylacz tryb automatycznego wykonywania polecen\n");
    } else {
        printf(" - 1 - Wlacz tryb automatycznego wykonywania polecen\n");
    }
    printf(" - 2 - Dopisz polecenie do tasmy\n");
    printf(" - 3 - Usun ostatnie polecenie z tasmy\n");
    printf(" - 4 - Wypisz wszystkie polecenia z tasmy polecen\n");
    printf(" - 5 - Wyczysc pamiec - usuwa wszystkie polecenia z tasmy i komorki pamieci!\n");
    printf(" - 6 - Wypisz zawartosc tasmy wejsciowej do konsoli\n");
    printf(" - 7 - Wypisz zawartosc tasmy wynikowej do konsoli/pliku\n");
    printf(" - 8 - Wypisz zawartosc wszystkich zaincjalizowanych komorek pamieci!\n");
    printf(" - 9 - Wczytaj tasme inputu z pliku\n");
    printf("---------------------------------------------------------------------------------\n");
    printf("Wybierz opcje by kontynuowac: ");
    scanf("%d", &choice);
    switch(choice) {
    case 0:
        printf("Wylaczam program!\n");
        turn_off_engine(main_engine);
        break;
    case 1:
        if(status) {
            turn_off_engine(main_engine);
            printf("Wylaczono silnik!\n");
        } else {
            turn_on_engine(main_engine);
            printf("Wlaczono silnik!\n");
        }
        break;
    case 2:
        printf("Mozliwe komendy:\n");
        printf("HALT, READ, LOAD, STORE, ADD, SUB, MULT, DIV, JUMP, JGTZ, JZERO, WRITE\n");
        printf("Wpisz komende (bez argumentu!): ");
        char command[6];
        char payload[10];
        char marker[10];
        fflush(stdin);
        scanf("%s", &command);
        printf("Podano polecenie %s\n", command);
        printf("Czy chcesz podac marker?\n");
        printf("0 - nie\n1 - tak\nWybor: ");
        scanf("%d", &choice2);
        if(choice2) {
            printf("Podaj marker (do 5 liter): ");
            fflush(stdin);
            scanf("%s", &marker);
            printf("Podano marker %s\n", marker);
        }
        printf("Pominieto dodawanie markera\n");
        if(strcasecmp(command, "HALT") == 0) {
            attach_to_end(main_tape, "HALT", "", marker);
            printf("Dodano polecenie do tasmy!\n");
            break;
        } else if (strcasecmp(command, "READ") == 0) {
            attach_to_end(main_tape, "READ", payload, marker);
            printf("Dodano polecenie do tasmy!\n");
        } else {
            printf("Podaj argument polecenia: ");
            scanf("%s", &payload);
            printf("Podano argument %s\n", payload);
            printf("Pelne polecenie: %s %s , marker %s , zapisuje na tasmie!\n", command, payload, marker);
            if(strcasecmp(command, "LOAD") == 0) {
                attach_to_end(main_tape, "LOAD", payload, marker);
                printf("Dopisano LOAD do tasmy!\n");
            } else if(strcasecmp(command, "STORE") == 0) {
                attach_to_end(main_tape, "STORE", payload, marker);
                printf("Dopisano STORE do tasmy!\n");
            } else if(strcasecmp(command, "ADD") == 0) {
                attach_to_end(main_tape, "ADD", payload, marker);
                printf("Dopisano ADD do tasmy!\n");
            } else if(strcasecmp(command, "SUB") == 0) {
                attach_to_end(main_tape, "SUB", payload, marker);
                printf("Dopisano SUB do tasmy!\n");
            } else if(strcasecmp(command, "MULT") == 0) {
                attach_to_end(main_tape, "MULT", payload, marker);
                printf("Dopisano MULT do tasmy!\n");
            } else if(strcasecmp(command, "DIV") == 0) {
                attach_to_end(main_tape, "DIV", payload, marker);
                printf("Dopisano DIV do tasmy!\n");
            } else if(strcasecmp(command, "JUMP") == 0) {
                attach_to_end(main_tape, "JUMP", payload, marker);
                printf("Dopisano JUMP do tasmy\n");
            } else if(strcasecmp(command, "JZERO") == 0) {
                attach_to_end(main_tape, "JZERO", payload, marker);
                printf("Dopisano JZERO do tasmy\n");
            } else if(strcasecmp(command, "WRITE") == 0) {
                attach_to_end(main_tape, "WRITE", payload, marker);
                printf("Dopisano WRITE do tasmy\n");
            } else if(strcasecmp(command, "JGTZ") == 0) {
                attach_to_end(main_tape, "JGTZ", payload, marker);
                printf("Dopisano JGTZ do tasmy\n");
            } else {
                printf("Nie rozpoznano polecenia! Sprobuj jeszcze raz!\n");
            }
            break;
        }
    case 3:
        if(main_tape->next != NULL) {
            pop_last_exe(main_tape);
            printf("Usunieto ostatnie polecenie z tasmy!\n");
        } else {
            printf("Brak polecen na tasmie!\n");
        }
        break;
    case 4:
        printf("Wypisywanie wszystkich polecen!\n");
        print_all_exes(main_tape, true);
        printf("Wypisano!\n");
        break;
    case 5:
        clearMemory(main_tape, battery);
        printf("Wyczyszczono pamiec!\n");
        break;
    case 6:
        printf("Wypisywanie inputu!\n");
        print_all_exes(input, true);
        printf("Koniec inputu!\n");
        break;
    case 7:
        printf("Chcesz wypisac output do konsoli czy do pliku?\n");
        printf("0 - konsola\n1 - plik\n");
        printf("Twoj wybor: ");
        scanf("%d", &choice2);
        if(choice2) {
            char xyz[100];
            printf("Podaj nazwe pliku (w postaci 'nazwa.txt') do ktorego chcesz zapisac output: ");
            scanf("%s", &xyz);
            bool abc = write_output(xyz, output);
            if(!abc) {
                printf("Zapisano poprawnie!\n");
            } else {
                printf("Nie udalo sie zapisac!\n");
            }
        } else {
            printf("Wypisywanie outputu!\n");
            print_all_exes(output, true);
            printf("Koniec outputu!\n");
        }
        break;
    case 8:
        printf("Wypisuje zawartosc wszystkich zainicjalizowanych komorek!\n");
        print_all_cells(battery);
        printf("Koniec!\n");
        break;
    case 9:
        printf("Chcesz podac nazwe pliku czy wczytac z argumentow wywolania?\n");
        printf("0 - argumenty\n1 - podanie nazwy\n");
        printf("Twoj wybor: ");
        scanf("%d", &choice2);
        if(choice2) {
            char filename[100];
            printf("Podaj nazwe pliku w postaci 'nazwa.txt'\n");
            printf("Wpisz tutaj: ");
            fflush(stdin);
            scanf("%s", &filename);
            printf("Probuje znalezc plik!\n");
            readfile(filename, input);
        } else {
            if(checkIfArgv(argc)) {
                printf("Probuje znalezc pliki z argumentow!\n");
                for(int i=1; i<argc; i++) {
                    bool x = readfile(argv[i], input);
                    if(x == 1) {
                        printf("Error reading file!\n");
                    }
                }
            } else {
                printf("Nie ma argumentow wywolania!\n");
            }
        }
        printf("Aktualna zawartosc tasmy inputu: \n");
        print_all_exes(input, true);
        printf("Koniec inputu!\n");
        break;
    default:
        printf("Nie rozpoznano polecenia - sprobuj podac je ponownie!\n");
        break;
    }
}

// Wojciech Woźniak 339644

#include <stdbool.h>

/*
    Function to handle command line arguments and setup
*/
void handle_setup(int argc, char *argv[], bool debug);

/*
    Function to setup server socket
    Sets socket options
    Binds address and port
*/
void setup_server(int sockfd, bool debug);
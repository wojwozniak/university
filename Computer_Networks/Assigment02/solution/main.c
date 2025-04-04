// Wojciech Woźniak 339644
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>

#include "setup.h"
#include "routing_table.h"
#include "time_util.h"

#define TURN_INTERVAL_SECONDS 5 // Low, so we can test it quickly
#define DEBUG_MODE true

/*
    Main function of the program
    Routing table is defined in routing_table files
    It is initialized by handle_setup() function
    we access it via global variable:
        static RoutingEntry *routing_table
*/
int main(int argc, char *argv[])
{
    handle_setup(argc, argv, DEBUG_MODE);

    int sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock_fd < 0)
    {
        fprintf(stderr, "Error opening a socket!\n");
        exit(EXIT_FAILURE);
    }

    setup_server(sock_fd);

    // long long turn_start_timestamp = get_current_time_ms();
    for (int i = 0; i < 3; i++)
    {
        // send_table();
        uptick();
        sleep(TURN_INTERVAL_SECONDS);
        // receive_table();
        print_routing_table(DEBUG_MODE);
    }
}
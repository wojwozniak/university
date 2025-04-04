// Wojciech Woźniak 339644
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define TURN_INTERVAL_SECONDS 5 // Low, so we can test it quickly
#define DEBUG_MODE true

#include "routing_table.h"
#include "time_util.h"

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
    // long long turn_start_timestamp = get_current_time_ms();
    for (int i = 0; i < 3; i++)
    {
        // send_table();
        // uptick();
        uptick();
        sleep(TURN_INTERVAL_SECONDS);
        print_routing_table(DEBUG_MODE);
        // receive_table();
        // print_routing_table();
    }
}
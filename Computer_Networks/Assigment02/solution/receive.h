// Wojciech Woźniak 339644

#include <stdbool.h>

/*
    Receive packets from other nodes in the network and store them in a table.
*/
void receive_table(int sockfd, bool debug, int cooldown_time_ms, struct pollfd ps);
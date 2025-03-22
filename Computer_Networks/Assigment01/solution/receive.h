// Wojciech Woźniak 339644

/**
 * Function that receives packets with given ttl
 * Call function that prints output for a line
 * Returns 1 if program should continue
 * And 0 if target adress has been reached
 */
int receive_packets(int sockfd, char *target_str, int ttl, struct pollfd ps);
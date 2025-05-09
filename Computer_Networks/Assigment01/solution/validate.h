// Wojciech Woźniak 339644

#include <stdbool.h>

/**
 *  Function that validates arguments provided by user, specifically:
 *      - if user provided exactly one argument
 *      - if the argument provided is a correct IP adress
 */
int validate_arguments(int argc, char *argv[]);

/**
 * Function validating icmp packet
 * Checking if it belongs to our proccess
 * And if it is of correct ttl
 */
bool validate_packet(struct icmp *icmp_reply, int ttl);
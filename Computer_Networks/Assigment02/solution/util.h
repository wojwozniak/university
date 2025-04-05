// Wojciech Woźniak 339644

#include <stdbool.h>

/**
 * Function returning current time
 */
long long get_current_time_ms();

/**
 * Function checking if given address is one of the local addresses
 */
bool is_my_address(uint32_t sender_ip);
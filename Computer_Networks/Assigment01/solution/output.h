// Wojciech Woźniak 339644

/**
 * Auxiliary function to print out line of output
 * Also checks for destination IP - returns 0 if we are there and should stop
 * returns 1 if we should continue traceroute
 */
int print_output(int ttl, int res_count, char *target_str, uint32_t *ip_addresses, long long *timestamps);
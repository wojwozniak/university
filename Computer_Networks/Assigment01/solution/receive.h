/**
 * Function that receives packets with given ttl
 */
int receive_packets(int sockfd, char *target_str, long long traceroute_start, int ttl, struct pollfd ps);
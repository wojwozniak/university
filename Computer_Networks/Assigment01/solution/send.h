/**
 * Calculate ICMP checksum for packet that you are sending
 */
u_int16_t compute_icmp_checksum(const void *buff, int length);

/**
 * Setup icmp header for traceroute packets
 * icd_seq must be updated manually,
 * outside of function for each packet sent
 */
struct icmp setup_icmp_header(int id);

/**
 * Setup target structure (contains IP adress
 * to which we will send packets)
 * TTL has to be updated via socket
 */
struct sockaddr_in setup_icmp_target(char *target_ip_adress);
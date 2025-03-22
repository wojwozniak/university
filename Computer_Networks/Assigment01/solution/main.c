#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>

#include <poll.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>
#include <netinet/in.h>

#include "validate.h"
#include "send.h"
#include "receive.h"
#include "time_util.h"

#define MAX_TTL 30

/**
 * Main function
 * - validates arguments
 * - sets up raw socket
 * - set up structures for poll and icmp target
 * - starts traceroute
 */
int main(int argc, char *argv[])
{
    int arg_validation_result = validate_arguments(argc, argv);
    if (arg_validation_result != 0)
    {
        fprintf(stderr, "Correct usage: %s <IP_ADRESS>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    int sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);
    if (sockfd < 0)
    {
        fprintf(stderr, "Error opening a socket!\n");
        exit(EXIT_FAILURE);
    }

    struct sockaddr_in target = setup_icmp_target(argv[1]);

    char target_str[20];
    inet_ntop(AF_INET, &(target.sin_addr), target_str, sizeof(target_str));

    struct pollfd ps;
    ps.fd = sockfd;
    ps.events = POLLIN;
    ps.revents = 0;

    long long traceroute_start = get_current_time_ms();

    for (int ttl = 1; ttl <= MAX_TTL; ttl++)
    {
        send_packets(sockfd, target, ttl, 3);

        int res = receive_packets(sockfd, target_str, traceroute_start, ttl, ps);
        if (res == 0)
        {
            break;
        }
    }

    return 0;
}
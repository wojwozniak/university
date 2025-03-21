#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include <poll.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>
#include <netinet/in.h>

#include "validate.h"
#include "send.h"
#include "traceroute.h"

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

    struct pollfd ps;
    ps.fd = sockfd;
    ps.events = POLLIN;
    ps.revents = 0;

    return traceroute(sockfd, target, ps);
}
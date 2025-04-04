// Wojciech Woźniak 339644

#include <stdio.h>
#include <stdlib.h>
#include <poll.h>
#include <unistd.h>
#include <arpa/inet.h>

#include "setup.h"
#include "routing_table.h"
#include "time_util.h"
#include "send.h"
#include "receive.h"

#define TURN_INTERVAL_SECONDS 2 // Low, so we can test it quickly
#define IS_DEBUG_MODE true

int main(int argc, char *argv[])
{
    handle_setup(argc, argv, IS_DEBUG_MODE);

    int sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock_fd < 0)
    {
        fprintf(stderr, "Error opening a socket!\n");
        exit(EXIT_FAILURE);
    }

    setup_server(sock_fd, IS_DEBUG_MODE);

    struct pollfd ps;
    ps.fd = sock_fd;
    ps.events = POLLIN;
    ps.revents = 0;

    for (;;)
    {
        send_table(sock_fd, IS_DEBUG_MODE);
        uptick();
        receive_table(sock_fd, IS_DEBUG_MODE, 5000, ps);
        print_routing_table(IS_DEBUG_MODE);
    }

    close(sock_fd);
}
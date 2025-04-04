// Wojciech Woźniak 339644

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdbool.h>

#include "routing_table.h"

void handle_setup(int argc, char *argv[], bool debug)
{
    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s <n> n*{<ip/mask> distance <distance>}\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    int n = atoi(argv[1]);

    if (argc != 2 + n * 3)
    {
        fprintf(stderr, "Expected %d arguments for %d networks, got %d\n", 2 + n * 3, n, argc);
        exit(EXIT_FAILURE);
    }

    init_routing_table(n);

    for (int i = 2; i < argc; i += 3)
    {
        char *ip_mask = argv[i];
        char *distance_str = argv[i + 2];

        char *slash = strchr(ip_mask, '/');
        *slash = '\0';
        char *ip_str = ip_mask;
        char *mask_str = slash + 1;

        uint32_t ip = inet_addr(ip_str);
        if (ip == INADDR_NONE)
        {
            fprintf(stderr, "Invalid IP address: %s\n", ip_str);
            exit(EXIT_FAILURE);
        }

        uint8_t mask = atoi(mask_str);
        uint32_t distance = atoi(distance_str);
        update_routing_entry(ip, mask, distance, 0);
    }

    print_routing_table(debug);
}

void setup_server(int sockfd, bool debug)
{
    int broadcastPermission = 1;
    int upt_sock = setsockopt(sockfd, SOL_SOCKET, SO_BROADCAST, (void *)&broadcastPermission, sizeof(broadcastPermission));
    if (upt_sock < 0)
    {
        fprintf(stderr, "Error updating socket options!\n");
        exit(EXIT_FAILURE);
    }

    struct sockaddr_in server;
    memset(&server, 0, sizeof(server));
    server.sin_family = AF_INET;
    server.sin_port = htons(54321);
    server.sin_addr.s_addr = htonl(INADDR_ANY);

    int res = bind(
        sockfd,
        (struct sockaddr *)&server,
        sizeof(server));

    if (res < 0)
    {
        fprintf(stderr, "Error binding socket!\n");
        exit(EXIT_FAILURE);
    }

    if (debug)
    {
        char ip_str[INET_ADDRSTRLEN];
        inet_ntop(AF_INET, &server.sin_addr, ip_str, sizeof(ip_str));
        printf("Server is running on %s:%d\n", ip_str, ntohs(server.sin_port));
    }
}
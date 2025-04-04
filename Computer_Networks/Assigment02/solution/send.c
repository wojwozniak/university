// Wojciech Woźniak 339644

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include "routing_table.h"

struct sockaddr_in *get_broadcast_addresses(int *count)
{
    int capacity = 1;
    struct sockaddr_in *broadcast_addresses = malloc(capacity * sizeof(struct sockaddr_in));
    if (broadcast_addresses == NULL)
    {
        fprintf(stderr, "malloc error!\n");
        exit(EXIT_FAILURE);
    }

    int direct_count = 0;
    int count_tab = get_entry_count();
    RoutingEntry *table = get_routing_table();
    for (int i = 0; i < count_tab; i++)
    {
        if (table[i].is_direct)
        {
            if (direct_count >= capacity)
            {
                capacity = capacity + 1;
                struct sockaddr_in *temp = realloc(broadcast_addresses, capacity * sizeof(struct sockaddr_in));
                if (temp == NULL)
                {
                    fprintf(stderr, "realloc error!\n");
                    free(broadcast_addresses);
                    exit(EXIT_FAILURE);
                }
                broadcast_addresses = temp;
            }

            memset(&broadcast_addresses[direct_count], 0, sizeof(struct sockaddr_in));
            broadcast_addresses[direct_count].sin_family = AF_INET;
            broadcast_addresses[direct_count].sin_port = htons(54321);

            uint32_t network_ip = table[i].network_ip;
            uint8_t mask = table[i].mask;
            uint32_t broadcast_ip = network_ip | (htonl(0xFFFFFFFF) >> mask);
            broadcast_addresses[direct_count].sin_addr.s_addr = broadcast_ip;

            direct_count++;
        }
    }

    *count = direct_count;
    return broadcast_addresses;
}

void send_table(int sockfd, bool debug)
{
    int direct_count;
    struct sockaddr_in *broadcast_addresses = get_broadcast_addresses(&direct_count);
    if (broadcast_addresses == NULL)
    {
        if (debug)
        {
            printf("Nowhere to send to!\n");
        }
        return;
    }

    int count = get_entry_count();
    RoutingEntry *table = get_routing_table();
    uint8_t packet[9];
    for (int i = 0; i < count; i++)
    {
        memcpy(packet, &table[i].network_ip, 4);
        packet[4] = table[i].mask;
        uint32_t dist = htonl(table[i].distance);
        memcpy(packet + 5, &dist, 4);

        for (int j = 0; j < direct_count; j++)
        {
            ssize_t bytes_sent = sendto(sockfd, packet, 9, 0, (struct sockaddr *)&broadcast_addresses[j], sizeof(broadcast_addresses[j]));
            if (bytes_sent < 0)
            {
                if (debug)
                {
                    printf("sendto failed to address ");
                    print_ip(table[i].network_ip, table[i].mask);
                    printf("\n");
                }
                set_entry_unreachable(i);
            }
            else if (debug)
            {
                char ip_str[INET_ADDRSTRLEN];
                inet_ntop(AF_INET, &broadcast_addresses[j].sin_addr, ip_str, sizeof(ip_str));
                printf("Sent packet to %s:54321 - ", ip_str);
                print_ip(table[i].network_ip, table[i].mask);
                printf("\n");
            }
        }
    }

    free(broadcast_addresses);
}
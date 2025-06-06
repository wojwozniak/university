// Wojciech Woźniak 339644

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <string.h>
#include <poll.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>
#include <netinet/in.h>
#include <netinet/ip.h>

#include "util.h"
#include "routing_table.h"

void receive_table(int sockfd, bool debug, int cooldown_time_ms, struct pollfd ps)
{
    long long start_time = get_current_time_ms();
    long long deadline = start_time + cooldown_time_ms;
    long long time_left = 0;

    for (;;)
    {
        time_left = deadline - get_current_time_ms();
        if (time_left <= 0)
        {
            break;
        }
        int ready = poll(&ps, 1, time_left);
        if (ready < 0)
        {
            fprintf(stderr, "Error waiting for response\n");
            exit(EXIT_FAILURE);
        }
        else if (ready == 0)
        {
            if (debug)
            {
                printf("Listen timeout\n");
            }

            break;
        }

        if (ps.revents & POLLIN)
        {
            struct sockaddr_in sender;
            socklen_t sender_len = sizeof(sender);
            u_int8_t buffer[IP_MAXPACKET + 1];
            ssize_t datagram_len = recvfrom(sockfd, buffer, IP_MAXPACKET, 0, (struct sockaddr *)&sender, &sender_len);
            char sender_ip_str[20];
            inet_ntop(AF_INET, &(sender.sin_addr), sender_ip_str, sizeof(sender_ip_str));
            if (debug)
            {
                printf("Received UDP packet from IP address: %s, port: %d\n", sender_ip_str, ntohs(sender.sin_port));
            }
            if (ntohs(sender.sin_port) != 54321)
            {
                continue;
            }
            buffer[datagram_len] = 0;
            uint32_t ip;
            memcpy(&ip, buffer, 4);
            uint8_t mask = buffer[4];
            uint32_t dist;
            memcpy(&dist, buffer + 5, 4);
            dist = ntohl(dist);
            if (debug)
            {
                printf("Received entry: IP=");
                print_ip(ip, mask);
                printf(" dist=%u\n", dist);
            }
            update_routing_entry(ntohl(ip), mask, dist, ntohl(sender.sin_addr.s_addr), false, debug);
        }
    }
}
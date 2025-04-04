// Wojciech Woźniak 339644

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <poll.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>
#include <netinet/in.h>
#include <netinet/ip.h>

#include "time_util.h"

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
            printf("Received UDP packet from IP address: %s, port: %d\n", sender_ip_str, ntohs(sender.sin_port));
            buffer[datagram_len] = 0;
            printf("%ld-byte message: +%s+\n", datagram_len, buffer);
            if (debug)
            {
                printf("Debug\n");
            }
        }
    }
}
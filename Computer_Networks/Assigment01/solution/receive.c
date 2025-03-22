#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <poll.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>
#include <netinet/in.h>
#include <netinet/ip.h>

#include "time_util.h"
#include "output.h"

bool validate_icmp(struct icmp *icmp_reply, int ttl)
{
    bool is_ours = icmp_reply->icmp_id == getpid();
    bool is_correct_ttl = icmp_reply->icmp_seq / 3 == (ttl - 1);
    return is_ours && is_correct_ttl;
}

bool validate_packet(struct icmp *icmp_reply, int ttl)
{
    if (icmp_reply->icmp_type == ICMP_ECHOREPLY)
    {
        return validate_icmp(icmp_reply, ttl);
    }
    else if (icmp_reply->icmp_type == ICMP_TIME_EXCEEDED)
    {
        struct ip *body = (struct ip *)&icmp_reply->icmp_data;
        struct icmp *body_icmp = (struct icmp *)((char *)body + 4 * body->ip_hl);
        return validate_icmp(body_icmp, ttl);
    }
    return false;
}

int receive_packets(int sockfd, char *target, long long traceroute_start, int ttl, struct pollfd ps)
{
    long long interval_start = get_current_time_ms();
    long long deadline = interval_start + 1000;
    long long time_left = 0;

    int correct_responses = 0;
    uint32_t ip_addresses[3];
    long long timestamps[3];

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
            break;
        }

        if (ps.revents & POLLIN)
        {
            struct sockaddr_in sender;
            socklen_t sender_len = sizeof(sender);
            u_int8_t buffer[IP_MAXPACKET];

            ssize_t packet_len = recvfrom(sockfd, buffer, IP_MAXPACKET, 0, (struct sockaddr *)&sender, &sender_len);
            if (packet_len < 0)
            {
                fprintf(stderr, "Error receiving packet!\n");
                exit(EXIT_FAILURE);
            }

            struct ip *ip_header = (struct ip *)buffer;
            ssize_t ip_header_len = 4 * (ssize_t)(ip_header->ip_hl);
            u_int8_t *ip_data = buffer + ip_header_len;
            struct icmp *icmp_reply = (struct icmp *)ip_data;

            uint32_t addr = 0;

            if (validate_packet(icmp_reply, ttl))
            {
                addr = sender.sin_addr.s_addr;
            }
            else
            {
                continue;
            }

            ip_addresses[correct_responses] = addr;
            timestamps[correct_responses] = get_current_time_ms() - traceroute_start;
            correct_responses += 1;

            if (correct_responses == 3)
            {
                break;
            }
        }
    }

    return print_output(ttl, correct_responses, target, ip_addresses, timestamps);
}
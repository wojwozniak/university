#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>
#include <netinet/in.h>
#include <netinet/ip.h>

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
        u_int8_t *icmp_packet = icmp_reply->icmp_data + 4 * body->ip_hl;
        struct icmp *body_icmp = (struct icmp *)icmp_packet;
        return validate_icmp(body_icmp, ttl);
    }
    return false;
}

int validate_arguments(int argc, char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "Error: Provide an IP adress!\n");
        return 1;
    }
    if (argc > 2)
    {
        fprintf(stderr, "Error: Too many arguments!\n");
        return 1;
    }
    if (inet_addr(argv[1]) == (in_addr_t)(-1))
    {
        fprintf(stderr, "Error: Incorrect IP adress!\n");
        return 1;
    }
    return 0;
}
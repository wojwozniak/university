// Wojciech Woźniak 339644
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/ip_icmp.h>

u_int16_t compute_icmp_checksum(const void *buff, int length)
{
    const u_int16_t *ptr = buff;
    u_int32_t sum = 0;
    assert(length % 2 == 0);
    for (; length > 0; length -= 2)
        sum += *ptr++;
    sum = (sum >> 16U) + (sum & 0xffffU);
    return ~(sum + (sum >> 16U));
}

struct icmp setup_icmp_header(int seq)
{
    struct icmp header;
    memset(&header, 0, sizeof(header));
    header.icmp_type = ICMP_ECHO;
    header.icmp_code = 0;
    header.icmp_hun.ih_idseq.icd_id = getpid() & 0xFFFF;
    header.icmp_hun.ih_idseq.icd_seq = seq;
    header.icmp_cksum = compute_icmp_checksum(
        (u_int16_t *)&header, sizeof(header));

    return header;
}

struct sockaddr_in setup_icmp_target(char *target_ip_adress)
{
    struct sockaddr_in target;
    memset(&target, 0, sizeof(target));
    target.sin_family = AF_INET;
    if (inet_pton(AF_INET, target_ip_adress, &target.sin_addr) <= 0)
    {
        fprintf(stderr, "Invalid target IP address: %s\n", target_ip_adress);
        exit(EXIT_FAILURE);
    }
    return target;
}

void send_packets(int sockfd, struct sockaddr_in target, int ttl, int packet_count)
{
    int upt_sock = setsockopt(sockfd, IPPROTO_IP, IP_TTL, &ttl, sizeof(int));
    if (upt_sock < 0)
    {
        fprintf(stderr, "ERROR: Could not update sock!");
        exit(EXIT_FAILURE);
    }
    for (int i = 0; i < packet_count; i++)
    {
        int seq = (ttl - 1) * 3 + i;
        struct icmp icmp_header = setup_icmp_header(seq);
        ssize_t sent = sendto(sockfd, &icmp_header, sizeof(icmp_header), 0, (struct sockaddr *)&target, sizeof(target));
        if (sent < 0)
        {
            fprintf(stderr, "Error sending packet!\n");
            exit(EXIT_FAILURE);
        }
    }
}
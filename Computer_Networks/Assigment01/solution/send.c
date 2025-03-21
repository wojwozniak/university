#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
    return (u_int16_t)(~(sum + (sum >> 16U)));
}

struct icmp setup_icmp_header(u_int16_t id)
{
    struct icmp header;
    header.icmp_type = ICMP_ECHO;
    header.icmp_code = 0;
    header.icmp_hun.ih_idseq.icd_id = id;
    header.icmp_hun.ih_idseq.icd_seq = 0;
    header.icmp_cksum = compute_icmp_checksum(
        (u_int16_t *)&header, sizeof(header));

    return header;
}

struct sockaddr_in setup_icmp_target(char *target_ip_adress)
{
    struct sockaddr_in target;
    memset(&target, 0, sizeof(target));
    target.sin_family = AF_INET;
    inet_pton(AF_INET, target_ip_adress, &target.sin_addr);
    return target;
}

void send_packets(int sockfd, struct icmp icmp_header, struct sockaddr_in target, int ttl, int packet_count)
{
    setsockopt(sockfd, IPPROTO_IP, IP_TTL, &ttl, sizeof(int));
    for (int i = 0; i < packet_count; i++)
    {
        int icd_seq = (ttl - 1) * 3 + i;
        icmp_header.icmp_hun.ih_idseq.icd_seq = icd_seq;
        printf("Sending packet with TTL %d - icd_seq %d\n", ttl, icd_seq);
        ssize_t bytes_sent = sendto(
            sockfd,
            &icmp_header,
            sizeof(icmp_header),
            0,
            (struct sockaddr *)&target,
            sizeof(target));

        printf("Bytes sent %zd\n", bytes_sent);
    }
}
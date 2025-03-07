#include <arpa/inet.h>
#include <errno.h>
#include <netinet/ip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void ERROR(const char *str)
{
    fprintf(stderr, "%s: %s\n", str, strerror(errno));
    exit(EXIT_FAILURE);
}

void print_as_bytes(unsigned char *buff, ssize_t length)
{
    for (ssize_t i = 0; i < length; i++, buff++)
        printf("%.2x ", *buff);
}

int main()
{
    int sock_fd = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);
    if (sock_fd < 0)
        ERROR("socket error");

    for (;;)
    {
        struct sockaddr_in sender;
        socklen_t sender_len = sizeof(sender);
        u_int8_t buffer[IP_MAXPACKET];

        ssize_t packet_len = recvfrom(sock_fd, buffer, IP_MAXPACKET, 0, (struct sockaddr *)&sender, &sender_len);
        if (packet_len < 0)
            ERROR("recvfrom error");

        char sender_ip_str[20];
        inet_ntop(AF_INET, &(sender.sin_addr), sender_ip_str, sizeof(sender_ip_str));
        printf("Received IP packet with ICMP content from: %s\n", sender_ip_str);

        struct ip *ip_header = (struct ip *)buffer;
        ssize_t ip_header_len = 4 * (ssize_t)(ip_header->ip_hl);

        printf("IP header: ");
        print_as_bytes(buffer, ip_header_len);
        printf("\n");

        printf("IP data:   ");
        print_as_bytes(buffer + ip_header_len, packet_len - ip_header_len);
        printf("\n\n");
    }
}
// Wojciech Woźniak 339644

#include <sys/time.h>
#include <stdio.h>
#include <netinet/in.h>
#include <ifaddrs.h>
#include <stdbool.h>

long long get_current_time_ms()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000LL + tv.tv_usec / 1000LL;
}

bool is_my_address(uint32_t sender_ip)
{
    in_addr_t sender_ip_casted = htonl(sender_ip);

    struct ifaddrs *ifaddr, *ifa;
    if (getifaddrs(&ifaddr) == -1)
    {
        fprintf(stderr, "getifaddrs error!");
        return false;
    }

    for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next)
    {
        if (ifa->ifa_addr == NULL)
        {
            continue;
        }

        if (ifa->ifa_addr->sa_family == AF_INET)
        {
            struct sockaddr_in *local_addr = (struct sockaddr_in *)ifa->ifa_addr;
            in_addr_t local_ip = local_addr->sin_addr.s_addr;

            if (local_ip == sender_ip_casted)
            {
                freeifaddrs(ifaddr);
                return true;
            }
        }
    }

    freeifaddrs(ifaddr);
    return false;
}
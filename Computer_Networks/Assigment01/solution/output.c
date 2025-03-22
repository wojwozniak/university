// Wojciech Woźniak 339644
#include <stdio.h>
#include <string.h>
#include <arpa/inet.h>

int print_output(int ttl, int res_count, char *target_str, uint32_t *ip_addresses, long long *timestamps)
{
    printf("%d. ", ttl);
    if (res_count == 0)
    {
        printf("*\n");
        return 1;
    }

    char sender_ip_str[res_count][20];
    for (int i = 0; i < res_count; i++)
    {
        if (inet_ntop(AF_INET, &ip_addresses[i], sender_ip_str[i], sizeof(sender_ip_str[i])) == NULL)
        {
            fprintf(stderr, "Error converting IP adress!\n");
            return 1;
        }
    }

    printf("%s ", sender_ip_str[0]);
    for (int i = 1; i < res_count; i++)
    {
        if (strcmp(sender_ip_str[i], sender_ip_str[i - 1]) != 0)
        {
            printf("%s ", sender_ip_str[i]);
        }
    }

    if (res_count == 3)
    {
        printf("%lld ms\n", (timestamps[0] + timestamps[1] + timestamps[2]) / 3);
    }
    else
    {
        printf(" ???\n");
    }

    for (int i = 0; i < res_count; i++)
    {
        if (strcmp(sender_ip_str[i], target_str) == 0)
        {
            return 0;
        }
    }

    return 1;
}
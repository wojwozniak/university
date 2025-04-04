#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#include "routing_table.h"

static RoutingEntry *routing_table = NULL;
static int entry_count = 0;
static int table_capacity = 0;

void init_routing_table(int initial_size)
{
    routing_table = malloc(initial_size * sizeof(RoutingEntry));
    if (routing_table == NULL)
    {
        fprintf(stderr, "malloc error!\n");
        exit(EXIT_FAILURE);
    }
    table_capacity = initial_size;
    entry_count = 0;
}

// Not to be used directly, will be called by update_routing_entry() if needed
void add_routing_entry(uint32_t ip, uint8_t mask, uint32_t dist, uint32_t next)
{
    if (entry_count >= table_capacity)
    {
        table_capacity = table_capacity ? table_capacity + 1 : 25;
        RoutingEntry *temp = realloc(routing_table, table_capacity * sizeof(RoutingEntry));
        if (temp == NULL)
        {
            fprintf(stderr, "realloc error!\n");
            return;
        }
        routing_table = temp;
    }

    routing_table[entry_count].network_ip = ip;
    routing_table[entry_count].mask = mask;
    routing_table[entry_count].distance = dist;
    routing_table[entry_count].next_hop = next;
    routing_table[entry_count].is_direct = (next == 0);
    routing_table[entry_count].last_update = 0;
    entry_count++;
}

void update_routing_entry(uint32_t ip, uint8_t mask, uint32_t new_dist, uint32_t new_next)
{
    for (int i = 0; i < entry_count; i++)
    {
        if (routing_table[i].network_ip == ip && routing_table[i].mask == mask)
        {
            if (new_dist < routing_table[i].distance)
            {
                routing_table[i].distance = new_dist;
                routing_table[i].next_hop = new_next;
                routing_table[i].is_direct = (new_next == 0);
                routing_table[i].last_update = 0;
            }
            else if (new_dist == routing_table[i].distance)
            {
                routing_table[i].last_update = 0;
            }
            return;
        }
    }
    add_routing_entry(ip, mask, new_dist, new_next);
}

void free_routing_table()
{
    free(routing_table);
    routing_table = NULL;
    entry_count = 0;
    table_capacity = 0;
}

static void print_ip(uint32_t ip, uint8_t mask)
{
    printf("%u.%u.%u.%u/%u", (ip >> 24) & 0xFF, (ip >> 16) & 0xFF, (ip >> 8) & 0xFF, ip & 0xFF, mask);
}

void print_routing_table(bool debug)
{
    for (int i = 0; i < entry_count; i++)
    {
        print_ip(routing_table[i].network_ip, routing_table[i].mask);
        if (routing_table[i].distance == INFINITY || routing_table[i].last_update >= TICKS_TIMEOUT)
        {
            printf(" unreachable\n");
        }
        else
        {
            printf(" distance %u %s", routing_table[i].distance, routing_table[i].is_direct ? "connected directly" : "via ");
            if (!routing_table[i].is_direct)
            {
                print_ip(routing_table[i].next_hop, 0);
            }
            printf("\n");
        }
        if (debug)
        {
            printf("Additional debug info for network above:\n");
            printf("Last updated %u ticks ago\n", routing_table[i].last_update);
        }
    }
}

void uptick()
{
    for (int i = 0; i < entry_count; i++)
    {
        routing_table[i].last_update++;
    }
}

void handle_setup(int argc, char *argv[], bool debug)
{
    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s <n> n*{<ip/mask> distance <distance>}\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    int n = atoi(argv[1]);

    if (argc != 2 + n * 3)
    {
        fprintf(stderr, "Expected %d arguments for %d networks, got %d\n", 2 + n * 3, n, argc);
        exit(EXIT_FAILURE);
    }

    init_routing_table(n);

    for (int i = 2; i < argc; i += 3)
    {
        char *ip_mask = argv[i];
        char *distance_str = argv[i + 2];

        char *slash = strchr(ip_mask, '/');
        *slash = '\0';
        char *ip_str = ip_mask;
        char *mask_str = slash + 1;

        uint32_t ip = inet_addr(ip_str);
        if (ip == INADDR_NONE)
        {
            fprintf(stderr, "Invalid IP address: %s\n", ip_str);
            exit(EXIT_FAILURE);
        }

        uint8_t mask = atoi(mask_str);
        uint32_t distance = atoi(distance_str);
        add_routing_entry(ip, mask, distance, 0);
    }

    print_routing_table(debug);
}
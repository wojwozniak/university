// Wojciech Woźniak 339644

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdbool.h>

#include "routing_table.h"
#include "util.h"

static RoutingEntry *routing_table = NULL;
static int entry_count = 0;
static int table_capacity = 0;

int get_entry_count()
{
    return entry_count;
}

RoutingEntry *get_routing_table()
{
    return routing_table;
}

void set_entry_unreachable(uint32_t target_ip)
{
    for (int i = 0; i < entry_count; i++)
    {
        uint32_t network_ip = target_ip & (0xFFFFFFFF << (32 - routing_table[i].mask));
        if (routing_table[i].network_ip == network_ip)
        {
            routing_table[i].distance = INFINITY;
            routing_table[i].last_update = TICKS_TIMEOUT;
            routing_table[i].next_hop = 0;
        }
    }
}

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
void add_routing_entry(uint32_t ip, uint8_t mask, uint32_t dist, uint32_t next, bool is_direct)
{
    if (entry_count >= table_capacity)
    {
        table_capacity = table_capacity ? table_capacity * 2 : 25;
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
    routing_table[entry_count].address_given_as_direct = is_direct;
    if (is_direct)
    {
        routing_table[entry_count].original_distance = dist;
    }
    else
    {
        routing_table[entry_count].original_distance = INFINITY;
    }

    entry_count++;
}

void update_routing_entry(uint32_t ip2, uint8_t mask, uint32_t new_dist, uint32_t new_next, bool is_direct, bool debug)
{
    uint32_t ip = ntohl(ip2);

    if (debug)
    {
        printf("Updating entry: IP=");
        print_ip(ip, mask);
        printf("\n");
        printf("New distance %u\n", new_dist);
    }

    // Added in setup - we know it won't be on the list
    if (is_direct)
    {
        add_routing_entry(ip, mask, new_dist, new_next, is_direct);
    }

    bool from_own_adress = is_my_address(new_next);
    bool packet_was_found = false;

    if (from_own_adress)
    {
        // If packet is from has been sent from our own adress
        // Then we are interested in from which exact network it has been sent
        // We only want to use response from given network to update info about that network
        for (int i = 0; i < entry_count; i++)
        {
            uint32_t network_ip = new_next & (0xFFFFFFFF << (32 - routing_table[i].mask));
            if (routing_table[i].network_ip == network_ip)
            {
                packet_was_found = true;
                // Found the network to be updated
                // We still need to check if distance is smaller or equal original_distance
                // If it is then update
                uint32_t od = routing_table[i].original_distance;
                if (od <= routing_table[i].distance)
                {
                    routing_table[i].distance = od;
                    routing_table[i].last_update = 0;
                    routing_table[i].next_hop = 0;
                    routing_table[i].is_direct = true;
                }
            }
        }
    }
    else
    {
        // Packet from other network
        // First we need to update the distance to account for network distance
        for (int i = 0; i < entry_count; i++)
        {
            uint32_t network_ip = new_next & (0xFFFFFFFF << (32 - routing_table[i].mask));
            if (routing_table[i].network_ip == network_ip)
            {
                new_dist += routing_table[i].distance;
                break;
            }
        }
        // Then we find actual row we are updating
        for (int i = 0; i < entry_count; i++)
        {
            if (routing_table[i].network_ip == ip)
            {
                packet_was_found = true;
                if (new_dist < routing_table[i].distance)
                {
                    // Overwrite distance if found smaller one
                    routing_table[i].distance = new_dist;
                    routing_table[i].last_update = 0;
                    routing_table[i].next_hop = new_next;
                    routing_table[i].is_direct = (new_next == 0);
                }
                else if (new_dist == routing_table[i].distance)
                {
                    // If the distance stays the same, update last_update, but only if route hasn't changed
                    if (routing_table[i].next_hop == new_next)
                    {
                        routing_table[i].last_update = 0;
                    }
                }
                else
                {
                    // Distance is bigger - do nothing
                }
            }
        }
    }
    if (!packet_was_found)
    {
        add_routing_entry(ip, mask, new_dist, new_next, false);
    }
}

void free_routing_table()
{
    free(routing_table);
    routing_table = NULL;
    entry_count = 0;
    table_capacity = 0;
}

void uptick()
{
    for (int i = 0; i < entry_count; i++)
    {
        routing_table[i].last_update++;
    }
}

void print_ip(uint32_t ip, uint8_t mask)
{
    if (mask == 0)
    {
        printf("%u.%u.%u.%u", (ip >> 24) & 0xFF, (ip >> 16) & 0xFF, (ip >> 8) & 0xFF, ip & 0xFF);
    }
    else
    {
        printf("%u.%u.%u.%u/%u", (ip >> 24) & 0xFF, (ip >> 16) & 0xFF, (ip >> 8) & 0xFF, ip & 0xFF, mask);
    }
}

void print_routing_table(bool debug)
{
    printf("\n");
    printf("Routing table:------------------------------------\n");
    for (int i = 0; i < entry_count; i++)
    {
        print_ip(routing_table[i].network_ip, routing_table[i].mask);
        if (routing_table[i].distance == INFINITY || routing_table[i].last_update >= TICKS_TIMEOUT)
        {
            routing_table[i].distance = INFINITY;
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
            printf("Last updated %u ticks ago\n", routing_table[i].last_update);
        }
    }
    printf("--------------------------------------------------\n");
}

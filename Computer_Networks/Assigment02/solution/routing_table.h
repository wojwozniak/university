// Wojciech Woźniak 339644

#include <stdint.h>
#include <stdbool.h>

#define INFINITY 18     // Maximum distance -> unreachable if reached
#define TICKS_TIMEOUT 3 // Number of rounds before entry is considered unreachable

typedef struct
{
    uint32_t network_ip; // Big Endian IP adress
    uint8_t mask;        // Mask (0-32)
    uint32_t distance;
    uint32_t next_hop; // 0 if direct
    bool is_direct;    // Syntax sugar for next_hop == 0
    int last_update;
} RoutingEntry;

/*
    Function initializing routing table with given size (n parameter from program input)
*/
void init_routing_table(int initial_size);

/*
    Updating or adding an entry to the routing table
*/
void update_routing_entry(uint32_t ip, uint8_t mask, uint32_t new_dist, uint32_t new_next);

/*
    Function updating last_update field of all entries
*/
void uptick();

/*
    Freeing memory at the end of the program
*/
void free_routing_table();

/*
    Printing well formatted IP address
*/
void print_ip(uint32_t ip, uint8_t mask);

/*
    Print table to stdout
*/
void print_routing_table(bool debug);

/*
    Function to get entry count
*/
int get_entry_count();

/*
    Function to get addresses list
*/
RoutingEntry *get_routing_table();

/*
    Set entry to unreachable
*/
void set_entry_unreachable(int index);
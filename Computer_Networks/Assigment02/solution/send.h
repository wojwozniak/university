// Wojciech Woźniak 339644

#include <stdbool.h>

/*
    Send current table content
    to every neighboring networks' broadcast adress
*/
void send_table(int sockfd, bool debug);
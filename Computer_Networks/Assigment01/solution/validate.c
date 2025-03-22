#include <stdio.h>
#include <arpa/inet.h>

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
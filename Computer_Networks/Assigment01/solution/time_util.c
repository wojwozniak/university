// Wojciech Woźniak 339644

#include <sys/time.h>
#include <stdio.h>

long long get_current_time_ms()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000LL + tv.tv_usec / 1000LL;
}
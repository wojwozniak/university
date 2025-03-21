#include <sys/time.h>
#include <assert.h>
#include <stdio.h>

long long get_current_time_ms()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000LL;
}

long long get_remaining_time_ms(long long deadline)
{
    return deadline - get_current_time_ms();
}

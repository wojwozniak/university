#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

u_int16_t compute_icmp_checksum(const void *buff, int length)
{
    const u_int16_t *ptr = buff;
    u_int32_t sum = 0;
    assert(length % 2 == 0);
    for (; length > 0; length -= 2)
        sum += *ptr++;
    sum = (sum >> 16U) + (sum & 0xffffU);
    return (u_int16_t)(~(sum + (sum >> 16U)));
}
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a, b = 0;
    scanf("%d %d", &a, &b);
    solve(a, b);
    return 0;
}

void solve(int a, int b)
{
    int bottom_index = (a + 2023) / 2024;
    int top_index = b / 2024;

    for(int i = bottom_index; i <= top_index; i++) {
        printf("%d ", i * 2024);
    }
}

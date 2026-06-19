#include <stdio.h>

int func1(int, int);
int func2(int, int);

int main() {
    printf("2 + 3 = %d\n", func1(2, 3));
    printf("3 + 4 = %d\n", func2(3, 4));
    return 0;
}

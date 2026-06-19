#include<stdio.h>

int used(int x) {
    return x + 1;
}

int unused(int x) {
    return x + 2;
}

int main() {
    printf("5 + 1 = %d\n", used(5));
    return 0;
}

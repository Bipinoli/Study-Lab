#include <stdio.h>

// linker creates the start and end address of the collected symbols
extern void * __start_myfuncs[];
extern void * __stop_myfuncs[];

int main() {
  void **cur;
  for (cur = __start_myfuncs; cur != __stop_myfuncs; cur += 1) {
    ((void (*)(void)) *cur)();
  }
  return 0;
}

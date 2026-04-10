#include<stdio.h>

static void func() {
  printf("Function from b.c\n");
}

static void * _myfuncs 
__attribute((section("myfuncs"), used)) = &func;

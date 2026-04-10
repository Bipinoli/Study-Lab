#include<stdio.h>

static void func() {
  printf("Function from a.c\n");
}

static void * _myfuncs 
__attribute((section("myfuncs"), used)) = &func;

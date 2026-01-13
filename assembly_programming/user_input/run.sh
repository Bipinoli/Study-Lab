#!/bin/bash

set -e

mkdir -p build
nasm -felf64 user_input.asm -o build/user_input.o
ld build/user_input.o -o build/user_input
./build/user_input

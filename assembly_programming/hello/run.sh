#!/bin/bash
set -e

mkdir -p build
nasm -felf64 hello.asm -o build/hello.o
ld build/hello.o -o build/hello
./build/hello


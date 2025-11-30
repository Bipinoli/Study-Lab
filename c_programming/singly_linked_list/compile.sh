#!/bin/bash

mkdir -p build
clang -Wall -g -fsanitize=address list.c -o build/list

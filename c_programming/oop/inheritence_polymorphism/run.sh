#!/bin/bash

set -e

gcc student.c teacher.c main.c -o main
./main

#!/bin/bash

#Author: Drashti Mehta
#Date: 09/05/2023
#Program name: 240 Section 03 Assignment 01 - Las Vegas

echo "This is program <Las Vegas>"

echo "Assembling asm file"
nasm -f elf64 -l lasvegas.lst -o lasvegas.o lasvegas.asm

echo "Compiling cpp file"
g++ -c -m64 -Wall main.cpp -o main.o -fno-pie -no-pie -std=c++17

echo "Linking the two object files"
g++ -m64 lasvegas.o main.o -o final -fno-pie -no-pie -std=c++17

echo "Running the program"
./final	

echo "The bash script is now closing."

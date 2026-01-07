# Menu-Driven ALU Calculator Using NASM

## Overview
This project implements a menu-driven calculator using x86-64 assembly language
with NASM. The program simulates core Arithmetic Logic Unit (ALU) operations by
reading user input, performing arithmetic computations, and displaying results
through standard output.

The calculator operates in a loop, allowing repeated execution of operations
until the user exits.

## Program Design
The program presents a menu to the user and accepts a choice corresponding to an
operation. Two integer operands are then read from input and processed using CPU
registers. The result is computed using low-level arithmetic instructions and
printed using the C runtime library.

Each menu option directly maps to an ALU-style operation executed at the
instruction level.

## Supported Operations
Addition  
Subtraction  
Multiplication  

The design can be extended to include logical operations such as AND, OR, XOR,
and NOT.

## Technical Details
- Written in x86-64 NASM syntax
- Uses `scanf` and `printf` for input/output
- Implements loop-based control flow
- Demonstrates register-level computation
- Follows Windows x64 calling conventions

## File Structure
src/alu_calculator.asm contains the complete assembly source code  
README.md provides documentation and usage information  

## Build and Run (Windows)
Assemble:
nasm -f win64 src/alu_calculator.asm -o alu_calculator.obj

Link:
link alu_calculator.obj kernel32.lib msvcrt.lib

Run:
alu_calculator.exe

## Concepts Demonstrated
- ALU arithmetic operations
- Low-level control flow and branching
- Register-based computation
- Interaction between assembly and C runtime
- Menu-driven program design in assembly

## Author
Mudassar Khan

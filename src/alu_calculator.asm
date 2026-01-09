default rel

extern printf
extern scanf
extern ExitProcess
global main

section .data
    menu     db 10,"1.Add  2.Sub  3.Mul  4.Div  8.Exit",10,"Choice: ",0
    fmtInt   db "%d",0
    fmtRes   db "Result = %d",10,0
    divErr   db "You can't divide by zero",10,0

    choice dd 0
    A      dd 0
    B      dd 0

section .text
main:
    sub rsp, 40              ; shadow space (Windows x64)

LOOP:
    ; show menu
    lea rcx, [menu]
    call printf

    ; read choice
    lea rcx, [fmtInt]
    lea rdx, [choice]
    call scanf

    mov eax, [choice]
    cmp eax, 8
    je EXIT

    ; read A
    lea rcx, [fmtInt]
    lea rdx, [A]
    call scanf

    ; read B
    lea rcx, [fmtInt]
    lea rdx, [B]
    call scanf

    mov eax, [A]
    mov ebx, [B]

    cmp dword [choice], 1
    je DO_ADD
    cmp dword [choice], 2
    je DO_SUB
    cmp dword [choice], 3
    je DO_MUL
    cmp dword [choice], 4
    je DO_DIV

    jmp LOOP                 ; invalid choice → restart

DO_ADD:
    add eax, ebx
    jmp PRINT

DO_SUB:
    sub eax, ebx
    jmp PRINT

DO_MUL:
    imul eax, ebx
    jmp PRINT

DO_DIV:
    cmp ebx, 0
    je DIV_ZERO

    xor edx, edx             ; clear remainder
    idiv ebx                 ; eax = eax / ebx
    jmp PRINT

DIV_ZERO:
    lea rcx, [divErr]
    call printf
    jmp LOOP

PRINT:
    lea rcx, [fmtRes]
    mov edx, eax
    call printf
    jmp LOOP

EXIT:
    xor ecx, ecx
    call ExitProcess

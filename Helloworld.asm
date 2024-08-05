section .data
    message db "Hello, World!", 0xA     ; original message
    length equ $ - message              ; length of the original message
    
section .text
    global _start
    
_start:

    mov eax, 0x4        ; write(
    mov ebx, 1          ;   FILE_DESCRIPTOR = STDOUT,
    mov ecx, message    ;   BUFFER = message,
    mov edx, length     ;   LENGTH = length
                        ; );
    int 0x80            ; syscall
    
    mov eax, 0x1        ; exit();
    int 0x80            ; syscall
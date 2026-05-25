.intel_syntax noprefix

.data
    newline: .asciz "\n"

.text
    .globl _start
_start:
    pop rax
    mov rbx, rax

    pop rsi

    pop rsi
    xor rdx, rdx
    call char_loop

    jmp exit

char_loop:
    cmp byte ptr [rsi + rdx], 0
    jle char_loop_done
    inc rdx
    jmp char_loop

char_loop_done:
    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, newline
    mov rdx, 1
    syscall

    ret

exit:
    xor rdi, rdi
    mov rax, 60
    syscall  # sys_exit

.global _start
.intel_syntax noprefix

_start:
    // <syscall> sys_write
    // write to file descriptor `1` (stdout)
    // which effectively prints the `buffer`
    mov rax, 1
    mov rdi, 1
    lea rsi, [buffer]
    // hardcoded buffer length
    mov rdx, 14
    syscall

    // <syscall> sys_exit
    // exit with status code `0` (success)
    mov rax, 60
    mov rdi, 0
    syscall

// define the ascii char buffer
buffer:
    .ascii "Hello, World!\n\0"

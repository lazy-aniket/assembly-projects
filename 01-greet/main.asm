.global _start
.intel_syntax noprefix

_start:
    sub rsp, 32

    // <syscall> sys_write
    // write to file descriptor `1` (stdout)
    // which effectively prints the text
    mov rax, 1
    mov rdi, 1
    lea rsi, [ask_name]
    // hardcoded text length
    mov rdx, 19
    syscall

    // <syscall> sys_read
    // read the file descriptor `0` (stdin)
    // which effectively gets the input
    mov rax, 0
    mov rdi, 0
    mov rsi, rsp
    // hardcoded buffer length
    mov rdx, 32
    syscall

    // <syscall> sys_write
    // write to file descriptor `1` (stdout)
    // which effectively prints the prefix
    mov rax, 1
    mov rdi, 1
    lea rsi, [greet_prefix]
    // hardcoded text length
    mov rdx, 6
    syscall

    // <syscall> sys_write
    // write to file descriptor `1` (stdout)
    // which effectively prints the input
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    // hardcoded text length
    mov rdx, 32
    syscall

    // <syscall> sys_exit
    // exit with status code `0` (success)
    mov rax, 60
    mov rdi, 0
    syscall

ask_name:
    .asciz "What is your name?\n"

greet_prefix:
    .asciz "Hello "

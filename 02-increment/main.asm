.intel_syntax noprefix

// initialized global variables
// load into memory at program start
.data
    num: .quad 32

.text
    .globl _start
_start:
    // increment `num` and move it to `rcx`
    // use `gdb` to check `num` value
    // because writing numbers to stdout
    // that is a very complex process
    mov rax, [num]
    inc rax
    mov [num], rax
    mov rcx, [num]

// xor of same number is always 0 (rdi, rdi)
// apparently, this is better than setting 0
    xor rdi, rdi
    mov rax, 60
    syscall  # sys_exit

.intel_syntax noprefix

// initialized global variables
.data
    num: .int 79
// initialized global constants
// ".section" part is required
// as without it GCC might throw
// Error: "unknown pesudo-op: `.rodata`"
.section .rodata
    str_neg: .asciz "negative\n"
    str_pos: .asciz "positive\n"
    str_zero: .asciz "zero\n"

.text
    .globl _start
_start:
    // move `num` to `rax` register
    // then compare the value with 0
    // and jump to appropriate block
    mov rax, num
    cmp rax, 0      # $1, $2
    je cond_zero    # je, jump if $1 == $2
    jl cond_neg     # jl, jump if $1 < $2
    jg cond_pos     # jg, jump if $1 > $2

    // jump to the `exit` block
    // this is not a part of the previous condition
    // `jmp` instruction does unconditional jump
    jmp exit

// condition `num < 0` block
cond_neg:
    lea rsi, [str_neg]
    mov rdx, 9  # hardcoded str length
    jmp print

// condition `num > 0` block
cond_pos:
    lea rsi, [str_pos]
    mov rdx, 9  # hardcoded str length
    jmp print

// condition `num == 0` block
cond_zero:
    lea rsi, [str_zero]
    mov rdx, 5  # hardcoded str length
    jmp print

// `print` block writes data to stdout
// it needs `rsi` and `rdx` to be set.
print:
    mov rax, 1
    mov rdi, 1
    syscall

// define the `exit` block
// this is a cleaner way to exit
exit:
    xor rdi, rdi
    mov rax, 60
    syscall  # sys_exit

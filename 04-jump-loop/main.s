.intel_syntax noprefix

.data
    text: .asciz "hiii\n"
    num: .int 5

.text
    .globl _start
_start:
    // jump to the `loop block
    jmp loop
    jmp exit

// initialize the loop index
// and start the loop iteration
loop:
    // initialize the loop by
    // moving `num` to `rbx` register
    // jump to next iteration
    mov rbx, num
    jmp loop_iter

loop_iter:
    // compare loop index by 0
    // here it is stored in `rbx`
    cmp rbx, 0
    jg loop_body  # rbx > 0
    // i dont know how else to do this
    // so here is my half broken approach for this one
    // as much as i understood,
    // the compare needs something to jump to
    // when there was no `jump to an empty block`
    // it would still jump to `loop_body`
    // even if the conditions didnt met,
    // to prevent that behavior, jump to an empty block
    jmp empty_jump

loop_body:
    // decrement the value stored in `rbx`
    dec rbx

    // write the `text` to stdout
    mov rax, 1
    mov rdi, 1
    lea rsi, [text]
    mov rdx, 5 # hardcoded `text` length
    syscall  # sys_write

    // jump to next iteration
    jmp loop_iter

// define an empty block to get out of condition check
empty_jump:

exit:
    xor rdi, rdi
    mov rax, 60
    syscall  # sys_exit

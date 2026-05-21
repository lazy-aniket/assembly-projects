.intel_syntax noprefix

.section .rodata
    num: .int 10

.text
    .globl _start
_start:
    mov rax, num
    jmp sum_up

    jmp exit

// define the `sum_up` block
// this expects `rax` to store `N`
// then it moves that value to `rbx` (index)
// and, stores the sums in rax
// after loop is done result stays in `rax`
sum_up:
    mov rbx, rax
    xor rax, rax
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
    // add the value of `rbx` to `rax`
    add rax, rbx  # rax += rbx

    // decrement the loop index in `rbx`
    // and, jump to next iteration
    dec rbx
    jmp loop_iter

// define an empty block to get out of condition check
empty_jump:

exit:
    xor rdi, rdi
    mov rax, 60
    syscall  # sys_exit

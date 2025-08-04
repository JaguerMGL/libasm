.intel_syntax noprefix

.global ft_write

ft_write:
    mov rax, 1
    syscall
    cmp rax, 0
    jl error
    ret

error:
    neg rax
    mov r8, rax
    call __errno_location
    mov [rax], r8
    mov rax, -1
    ret

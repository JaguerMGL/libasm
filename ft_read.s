.intel_syntax noprefix

.global ft_read
.global _ft_read
.global __ft_read

ft_read:
_ft_read:
__ft_read:
    mov rax, 0
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
.intel_syntax noprefix

.global ft_strcmp

ft_strcmp:
    mov rcx, 0

loop:
    movzx rax, BYTE PTR [rdi + rcx]
    movzx rdx, BYTE PTR [rsi + rcx]
    cmp rax, rdx
    jne different
    cmp rax, 0
    jz equal
    inc rcx
    jmp loop

different:
    sub rax, rdx
    ret

equal:
    xor rax, rax
    ret

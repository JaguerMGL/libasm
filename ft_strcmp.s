section .text

global ft_strcmp

ft_strcmp:
    mov rcx, 0

loop:
    movzx rax, byte [rdi + rcx]
    movzx rdx, byte [rsi + rcx]
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

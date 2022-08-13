	extern printf

	section .data
	fmt    db "result %d",10,0
	
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rax, 600851475143
	mov rcx, 2
loop:	cmp rax, rcx
	jle  fin
divloop:
	mov r8, rax
	mov rdx, 0
	idiv rcx

	cmp rdx,0
	jz divloop
	mov rax, r8
	inc rcx
	jmp loop

fin:	mov rsi, rax
	xor rax,rax
	mov rdi, fmt
	call printf
	
	
	leave
	ret

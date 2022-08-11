	extern printf

	section .data
	fmt    db "result %d",10,0
	
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	xor rax, rax
	mov rbx, 1
	mov rcx, 2
loop:	cmp rcx, 4000000
	jge  fin
	
	mov rdx, rcx
	add rcx, rbx
	mov rbx, rdx

	and rdx, 0x01
	jnz loop
	add rax, rbx
	
	jmp loop

fin:	mov rsi, rax
	xor rax,rax
	mov rdi, fmt
	call printf
	
	
	leave
	ret

	extern printf
	section .data
	fmt	db "result %d",10, 0
	upb     equ 1000
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov r8, 3
	call sumloop
	mov rsi, rcx

	mov r8, 5
	call sumloop
	add rsi, rcx

	mov r8, 15
	call sumloop
	sub rsi, rcx
	
	mov rax, 0
	mov rdi, fmt
	call printf

	leave
	ret
sumloop:
	push rbp
	mov rbp,rsp
	xor rcx,rcx
	xor rbx,rbx
l1:	cmp rbx, upb
	jge sumloopout
	add rcx, rbx
	add rbx, r8
	jmp l1
sumloopout:
	leave
	ret
	
	
	

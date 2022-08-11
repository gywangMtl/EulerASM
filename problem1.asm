	extern printf
	section .data
	fmt	db "result %d",10, 0
	upb     equ 1000
	section .text
	global main
main:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	xor rbx, rbx
lp1:	
	add rbx, 3
	add rcx, rbx
	cmp rbx, upb-3
	jl lp1
	mov rsi, rcx

	xor rbx,rbx
	xor rcx,rcx
lp2:	
	add rbx, 5
	add rcx, rbx
	cmp rbx, upb-5
	jl lp2
	add rsi, rcx
	xor rbx,rbx
	xor rcx,rcx
lp3:	
	add rbx, 15
	add rcx, rbx
	cmp rbx, upb-15
	jl lp3
	sub rsi, rcx
	
	mov rax, 0
	mov rdi, fmt
	call printf

	leave
	ret
	
	
	

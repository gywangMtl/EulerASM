	extern printf
	section .data
	fmt	db "total = %llu",10, 0
	lvl     equ 1000000000
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	xor rsi, rsi
	xor rbx, rbx
l1:	inc rbx
	call seven
	add rsi, rax
	cmp rbx, lvl
	jl l1

	push rbx
	push rax
	push rsi

	mov rax, 0
	mov rdi, fmt
	call printf


	pop rsi
	pop rax
	pop rbx
	
	leave
	ret

seven:	push rbp
	mov rbp, rsp
	push rbx

	cmp rbx, 7
	jle svn_rtn
	dec rbx
	mov r8, 7
	mov rax, rbx
	xor rdx,rdx
	idiv r8
	mov r9, rdx
	inc r9
	mov rbx, rax
	inc rbx
	push r9
	call seven
	pop r9
	xor rdx,rdx
	imul rax, r9
	jmp svn_rtn2
svn_rtn:	
	mov rax, rbx
svn_rtn2:
	pop rbx
	leave
	ret

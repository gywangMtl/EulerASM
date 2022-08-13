	extern printf

	section .data
	fmt    db "found %d",10,0
	max3 equ 999
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov r10, 100*100
	mov r8, 100
	mov r9, 100
outer:
	cmp r8, max3
	jg fin
inner:
	cmp r9, max3
	jg nextouter
	mov  rax, r8
	imul rax,r9

	cmp rax, r10
	jl nextpair

	;; check palidome

	mov r10, rax
nextpair:
	inc r9
	jmp inner
nextouter:
	mov r9, 100
	inc r8
	jmp outer

fin:	mov rsi, r10
	xor rax,rax
	mov rdi, fmt
	call printf
	
	
	leave
	ret

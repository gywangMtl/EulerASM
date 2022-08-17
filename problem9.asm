	;; special Pythagorean triplet
	extern 	printf

	section .data
	fmt	db "%d^2 + %d^2 = %d^2", 10, 0
	fmt2	db "prod is  = %lld", 10, 0
	sum	equ	1000
	section .bss
	a	resq 	1
	prod    resq    1
	section .text
	global 	main
	
main:
	push 	rbp
	mov 	rbp, 	rsp

	mov 	rax,	1
	mov 	[a], 	rax
newa_start:
	cmp rax, sum/2
	jge end
	mov rbx, rax
newb_start:	
	inc rbx
	cmp rbx, sum
	jge newa_next

	mov rcx, sum
	sub rcx, rax
	sub rcx, rbx
	cmp rcx, rbx
	jle newa_next

	;; test a^2 + b^2 ?= c^2
	mov 	[a],	rax
	imul 	rax
	mov 	r8, rax
	mov 	rax,	rbx
	imul 	rbx
	mov 	r9, 	rax
	mov 	rax, 	rcx
	imul 	rcx
	mov 	r10, 	rax
	mov 	rax, 	[a]
	add 	r8, 	r9
	cmp 	r10, 	r8
	je 	found
	jmp 	newb_start

newa_next:

	inc rax
	jmp newa_start
found:
	mov rax, [a]
	imul rbx
	imul rcx
	mov [prod], rax
	
	mov rdi, fmt
	mov rsi, [a]
	mov rdx, rbx
	call printf

	mov rdi, fmt2
	mov rsi, [prod]
	call printf

end:	
	leave
	ret

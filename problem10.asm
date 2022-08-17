	;; sum of all primes under 2000000
	extern printf

	section .data
	fmt    db "Sum of all primes is %lld",10,0
	n  equ 2000000		

	section .bss
	p    resq 1
	sum  resq 1
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rax, 3
	mov [p], rax
	mov qword [sum], 5
	
nextPrime:
	add qword [p], 2
	cmp qword [p], n
	jge  fin
	mov r8,1
testF:
	add r8,2
	mov rax, [p]
	xor rdx, rdx
	idiv r8
	cmp rax, r8
	jl foundPrime
	cmp rdx,0
	jz nextPrime
	jmp testF
foundPrime:
	;; p is a prime

	mov rax, [p]
	add [sum], rax
l:	
	jmp nextPrime
fin:
	mov rsi, [sum]
	xor rax,rax
	mov rdi, fmt
	call printf	
	leave
	ret

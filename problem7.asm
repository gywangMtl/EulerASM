	;; find the 10001st prime
	extern printf

	section .data
	fmt    db "That number is %d",10,0
	n  equ 10001		

	section .bss
	p    resq 1
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rax, 3
	mov [p], rax
	mov rcx, 2
loop:	cmp rcx, n
	jge  fin
	
nextPrime:
	add qword [p], 2
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

	inc rcx
l:	
	jmp loop
fin:
	mov rsi, [p]
	xor rax,rax
	mov rdi, fmt
	call printf	
	leave
	ret

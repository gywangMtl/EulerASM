	extern printf

	section .data
	fmt     db 	"found %d = (%d * %d)",10,0

	section .bss
	product resq      1
	q       resq      1
	x       resq      1
	y       resq      1
	max3    equ 	999

	section .text
	global main
main:
	push rbp
	mov rbp, rsp
	mov r11, 10
	mov r10, 100*100
	mov  r8, 100
outer:
	cmp  r8, max3
	jg   fin
	mov  r9, r8
inner:
	cmp r9, max3
	jg nextouter
	mov  rax, r8
	imul rax,r9

	cmp rax, r10
	jl nextpair

	;; check if rax is a palidrome
	mov [product], rax
	xor rcx, rcx
paliLoop:	
	xor rdx, rdx
	
	idiv r11
	mov [q], rax	
	mov rax, rcx
	imul rax, r11
	mov rcx, rax
	add rcx, rdx
	mov rax, [q]
	cmp rax, 0
	jg paliLoop
	mov rax, [product]
	cmp rcx, rax
	jne nextpair
	mov r10, rax
	mov [x], r9
	mov [y], r8
nextpair:
	inc r9
	jmp inner
nextouter:
	inc r8
	jmp outer

fin:	mov rsi, r10
	xor rax,rax
	mov rdi, fmt
	mov rdx, [x]
	mov rcx, [y]
	call printf
	
	
	leave
	ret

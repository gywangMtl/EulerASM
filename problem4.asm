	extern printf

	section .data
	fmt     db 	"found %d",10,0
	ten     dq	10

	section .bss
	product resq      1
	q       resq      1
	r       resq      1
	p       resq      1
	max3    equ 	999

	section .text
	global main
main:
	push rbp
	mov rbp, rsp
	mov r10, 100*100
	mov  r8, 100
	mov  r9, 100
outer:
	cmp  r8, max3
	jg   fin
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
	mov r11, [ten]
divplace:
	idiv r11
	mov [q], rax	
	mov rax, rcx
br2:	
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

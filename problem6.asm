	extern printf
	section .data
	fmt     db 	"The diff is  %d .",10,0
	max_hrd   equ 	100
	section .text
	global main
main:
	push rbp
	mov rbp, rsp
	xor r10, r10
	mov  r8, 1
outer:
	cmp  r8, max_hrd - 1
	jg   fin
	mov  r9, r8
	inc r9
inner:
	cmp r9, max_hrd
	jg nextouter
	
	mov  rax, r8
	imul rax,r9
	shl rax, 1
	add r10, rax
nextpair:
	inc r9
	jmp inner
nextouter:
	inc r8
	jmp outer

fin:	mov rsi, r10
	xor rax,rax
	mov rdi, fmt
	call printf
	
	
	leave
	ret

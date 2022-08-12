	;; find smallest multiple of 1,2,...,20
	
	extern printf

	section .data
	fmt    db "The answer is %d",10,0
	
	section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rax, 1
	mov rbx, 2
loop:	cmp rbx, 20
	jg  fin

	call _findLCM
	mov rax, r8
	inc rbx
	jmp loop

fin:	mov rsi, rax
	xor rax,rax
	mov rdi, fmt
	call printf
		
	leave
	ret

;;; subroutine to find gcd of rax and rbx
_findLCM:
	push rbp
	mov rbp, rsp
	mov r8, rax
	mov r9, rax
modulo_loop:
	mov rax, r8
	mov rdx, 0
	idiv rbx
	cmp rdx, 0
	je done

bump:	
	add r8, r9
	jmp modulo_loop

done:	leave
	ret

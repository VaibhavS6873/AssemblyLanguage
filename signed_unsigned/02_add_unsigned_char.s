.section .rodata
	msg_main_print1:
	.string "carry bit on\t"
	
	msg_main_print2:
	.string "carry bit off\t"
	
	
.section .text
.globl	main
.type	main,@function
main:
		addl	$-16,%esp
		
		subl	$16,%esp
		
		movb	$100,%al
		movb	$155,%dl
		
		addb	%dl,%al
		
		jc		label_carry_on
		movl	$msg_main_print2,(%esp)
		call	printf
		jmp		label_out
		
	label_carry_on:
		movl	$msg_main_print1,(%esp)
		call	printf
		
		
	label_out:
		movl	$0,(%esp)
		call	exit

.section .rodata
	msg_main_print1:
	.string "overflow bit on\t"
	
	msg_main_print2:
	.string "overflow bit off\t"
	
	
.section .text
.globl	main
.type	main,@function
main:
		addl	$-16,%esp
		
		subl	$16,%esp
		
		movb	$-127,%al
		movb	$-1,%dl
		
		addb	%dl,%al
		
		jo		label_overflow_on
		movl	$msg_main_print2,(%esp)
		call	printf
		jmp		label_out
		
	label_overflow_on:
		movl	$msg_main_print1,(%esp)
		call	printf
		
		
	label_out:
		movl	$0,(%esp)
		call	exit

.section .rodata
	msg_main_print1:
	.string	"Invalid arguments:prog_name"
	
	msg_main_print2:
	.string	"Envp values are:"
	
.section .text
.globl	main
.type 	main,@function
main:
		pushl 	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		cmpl	$1,4(%ebp)
		je		label_next
		movl	$msg_main_print1,(%esp)
		call	puts
		movl	$-1,(%esp)
		call	exit
		
	label_next:
		movl	$msg_main_print2,(%esp)
		call	puts
		
		movl	$0,-4(%ebp)
		jmp		label_condition
		
	label_for:
		movl	(%eax,%edx,4),%ebx
		movl	%ebx, (%esp)
		call	puts
		
		addl	$1,-4(%ebp)
	label_condition:
		leal	16(%ebp),%eax
		movl	-4(%ebp),%edx
		movl	(%eax,%edx,4),%ebx
		cmpl	$0,%ebx
		jne		label_for
		
		
		
		movl	$0,(%esp)
		call	exit

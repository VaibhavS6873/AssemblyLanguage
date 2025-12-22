.section .rodata
	msg_main_print1:
	.string	"file_to_screen.txt"
	
	msg_main_print2:
	.string	"r"
	
	msg_main_print3:
	.string "\nCant Open File\n"
	
	msg_main_print4:
	.string "%s"
	
	
.section .text
.globl	main
.type 	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$64,%esp
		
		movl	$0,-4(%ebp)
		
		movl	$msg_main_print1,(%esp)
		movl	$msg_main_print2,4(%esp)
		call	fopen
		movl	%eax,-4(%ebp)
		
		cmpl	$0,%eax
		jne		label_while_condition
		movl	$msg_main_print3,(%esp)
		call	printf
		movl	$-1,(%esp)
		call	exit
		
	label_while:
		leal	-54(%ebp),%eax
		movl	$msg_main_print4,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
	label_while_condition:
		leal	-54(%ebp),%eax
		movl	-4(%ebp),%edx
		movl	%eax,(%esp)
		movl	$49,4(%esp)
		movl	%edx,8(%esp)
		call	fgets
		cmpl	$0,%eax
		jne		label_while
		
		movl	-4(%ebp),%eax
		movl	%eax,(%esp)
		call	fclose
		movl	$0,-4(%esp)
		
		movl	$0,(%esp)
		call	exit

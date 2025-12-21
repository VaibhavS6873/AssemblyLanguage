.section .rodata
	msg_main_print1:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print2:
	.string	"\n\nReverse String Is:\t"
	
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	strrev

		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		movl	$0,(%esp)
		call	exit

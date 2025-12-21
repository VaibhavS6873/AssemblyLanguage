.section .rodata
	msg_main_print1:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print2:
	.string	"\n\nSource String Is:\t"
	
	msg_main_print3:
	.string	"\n\nDestination String Is:\t"
	

.section .text
.globl	main
.type	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$48,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		leal	-20(%ebp),%eax
		leal	-40(%ebp),%edx
		movl	%edx,(%esp) #destination
		movl	%eax,4(%esp) #source
		call	strcpy
		
		movl	$msg_main_print3,(%esp)
		call	printf
		
		leal	-40(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		
		movl	$0,(%esp)
		call	exit

.section .rodata
	msg_main_print1:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print2:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print3:
	.string	"\n\nConcatenated String Is:\t"
	

.section .text
.globl	main
.type	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$80,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-60(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		leal	-60(%ebp),%eax
		leal	-20(%ebp),%edx
		movl	%eax,(%esp) 
		movl	%edx,4(%esp)
		call	strcat
		
		movl	$msg_main_print3,(%esp)
		call	printf
		
		leal	-60(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		
		movl	$0,(%esp)
		call	exit

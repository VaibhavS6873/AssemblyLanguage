.section .rodata
	msg_main_print1:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print2:
	.string	"\n\nEnter String To Be Found:\t"
	
	msg_main_print3:
	.string	"\n\nString Not Found\n"
	
	msg_main_print4:
	.string	"\n\nString Is Found At %d Location\n"
	
	msg_main_print5:
	.string	"\n\nString Found In '%s'\n"
	
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$64,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-40(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		leal	-20(%ebp),%eax
		leal	-40(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	myStrstr
		movl	%eax,-44(%ebp)
		
		cmpl	$0,%eax
		jne		label_else
		movl	$msg_main_print3,(%esp)
		call	puts
		jmp		label_end
		
label_else:
		leal	-20(%ebp),%eax
		movl	-44(%ebp),%edx
		subl	%eax,%edx
		addl	$1,%edx
		movl	$msg_main_print4,(%esp)
		movl	%edx,4(%esp)
		call	printf
		
		movl	-44(%ebp),%eax
		movl	$msg_main_print5,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
label_end:
		movl	$0,(%esp)
		call	exit
		
		

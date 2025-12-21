.section .rodata
	msg_main_print1:
	.string	"\n\nEnter String1:\t"
	
	msg_main_print2:
	.string "\n\nEnter String2:\t"
	
	msg_main_print3:
	.string "\n\nBoth Strings Are Same\n"
	
	msg_main_print4:
	.string	"\n\nBoth Strings Are Diffrent\n"
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16, %esp
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
		call	strcmp
		movl	%eax,-44(%ebp)
		
		movl	-44(%ebp),%eax
		cmpl	$0,%eax
		jne		label_else
		movl	$msg_main_print3,(%esp)
		call	printf
		jmp		label_next
		
label_else:
		movl	$msg_main_print4,(%esp)
		call	printf
		
label_next:
		call 	getchar
		
		movl	$0,(%esp)
		call	exit

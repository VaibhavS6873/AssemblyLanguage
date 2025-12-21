.section .rodata
	msg_main_print1:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print2:
	.string "\n\nEnter Character To Be Found:\t"
	
	msg_main_print3:
	.string "\n\nCharacter Is Not Found\n"
	
	msg_main_print4:
	.string	"\n\nCharacter Is Found At %d Location\n"
	
	msg_main_scan:
	.string "%c"
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16, %esp
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
		
		leal	-21(%ebp),%eax
		movl	$msg_main_scan,(%esp)
		movl	%eax,4(%esp)
		call	scanf
		
		leal	-20(%ebp),%eax
		movb	-21(%ebp),%dl
		movl	%eax,(%esp)
		movb	%dl,4(%esp)
		call	strrchr
		movl	%eax,-25(%ebp)
	
		cmpl	$0,%eax
		jne		label_else
		movl	$msg_main_print3,(%esp)
		call	printf
		jmp 	label_end
		
label_else:
		leal	-20(%ebp),%edx
		movl	-25(%ebp),%eax
		subl	%edx,%eax
		addl	$1,%eax
		movl	$msg_main_print4,(%esp)
		movl	%eax,4(%esp)	 
		call	printf
			
label_end:
		movl	$0,(%esp)
		call	exit

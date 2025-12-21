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
		call	myStrcpy
		
		movl	$msg_main_print3,(%esp)
		call	printf
		
		leal	-40(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		
		movl	$0,(%esp)
		call	exit
		
		
.globl	myStrcpy
.type	myStrcpy,@function
myStrcpy:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	8(%ebp),%edx
		movl	12(%ebp),%eax
	
		movl	$0,-4(%ebp)
		jmp		label_while_condition
		
	label_while:
		movl	(%eax,%ebx,1),%ecx
		movl	%ecx,(%edx,%ebx,1)
		addl	$1,-4(%ebp)
		
	label_while_condition:
		movl	-4(%ebp),%ebx
		cmpb	$0,(%eax,%ebx,1)
		jne		label_while
		
		movl	$0,(%edx,%ebx,1)
		
		movl	%ebp,%esp
		popl	%ebp
		ret
		
		

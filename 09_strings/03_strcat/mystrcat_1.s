.section .rodata
	msg_main_print1:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print2:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print3:
	.string	"\n\nConcatenated String Is:\t"
	
.section .text
.globl	main
.type 	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$48,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-40(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		leal	-20(%ebp),%eax
		leal	-40(%ebp),%edx
		movl	%edx,(%esp) #destination
		movl	%eax,4(%esp) #source
		call	myStrcat
		
		movl	$msg_main_print3,(%esp)
		call	printf
		
		leal	-40(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		movl	$0,(%esp)
		call	exit
		
		
.globl	myStrcat
.type 	myStrcat,@function
myStrcat:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	8(%ebp),%eax	#destination
		movl	12(%ebp),%edx	#source
		
		movl	$0,-4(%ebp) 	#iDest
		jmp		label_while1_condition
		
	label_while1:
		addl	$1,-4(%ebp)
		
	label_while1_condition:
		movl	-4(%ebp),%ecx
		cmpb	$0,(%eax,%ecx,1)
		jne		label_while1
		
	
		movl	$0,-8(%ebp)		#iSrc
		jmp		label_while2_condition
		
	label_while2:
		movb	(%edx,%ecx,1),%bl
		movl	-4(%ebp),%ecx
		movb	%bl,(%eax,%ecx,1)
		addl	$1,-4(%ebp)
		addl	$1,-8(%ebp)
		
	label_while2_condition:
		movl	-8(%ebp),%ecx
		cmpb	$0,(%edx,%ecx,1)
		jne		label_while2
		
		
		movl	-4(%ebp),%ebx
		movb	$0,(%eax,%ebx,1)
		
		movl	%ebp,%esp
		popl	%ebp
		ret
		
		
	
		

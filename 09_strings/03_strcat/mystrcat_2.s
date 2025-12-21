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
		
		movl	8(%ebp),%esi	#destination
		
		movl	$0,-4(%ebp) 	#iDest
		jmp		label_while1_condition
		
	label_while1:
		addl	$1,-4(%ebp)
		
	label_while1_condition:
		lodsb
		cmpb	$0,%al
		jne		label_while1
		
		subl	$1,%esi 			#as we are 1 position ahead of the null character
		movl	%esi,%edi
		movl	$0,-8(%ebp)		#iSrc
		movl	12(%ebp),%esi	#Source
		jmp		label_while2_condition
		
	label_while2:
		addl	$1,-8(%ebp)
		
	label_while2_condition:
		lodsb
		cmpb	$0,%al
		jne		label_while2
		
		movl	12(%ebp),%esi	#source
		movl	-8(%ebp),%ecx
		rep 	movsb
		
		movb	$0,%al
		stosb
		
		movl	%ebp,%esp
		popl	%ebp
		ret
		
		
	
		

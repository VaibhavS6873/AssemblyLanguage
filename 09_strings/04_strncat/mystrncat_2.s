.section .rodata
	msg_main_print1:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print2:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print3:
	.string	"\n\nEnter Value Of n:\t"
	
	msg_main_print4:
	.string	"\n\nConcatenated String Is:\t"
	
	msg_main_scan:
	.string	"%d"
	
.section .text
.globl	main
.type 	main,@function
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
		
		movl	$msg_main_print3,(%esp)
		call	printf

		leal	-64(%ebp),%eax
		movl	$msg_main_scan,(%esp)
		movl	%eax,4(%esp)
		call	scanf
		
		leal	-20(%ebp),%eax
		leal	-60(%ebp),%edx
		movl	-64(%ebp),%ebx
		movl	%edx,(%esp) 		#destination
		movl	%eax,4(%esp) 		#source
		movl	%ebx,8(%esp)		#value of n
		call	myStrncat
		
		movl	$msg_main_print4,(%esp)
		call	printf
		
		leal	-60(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		movl	$0,(%esp)
		call	exit
		
		
.globl	myStrncat
.type 	myStrncat,@function
myStrncat:
		
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	8(%ebp),%esi	#destination
		
		
	label_first_loop:
		lodsb
		cmpb	$0,%al
		jne		label_first_loop
		
		subl	$1,%esi
		movl	%esi,%edi
		movl	12(%ebp),%esi	#source
		movl	16(%ebp),%ecx	#value of n
	
		movl	$0,-8(%ebp)
	label_second_loop:
		lodsb
		cmpb	$0,%al
		je		label_copy
		cmpl	$0,%ecx
		jle		label_copy
		addl	$1,-8(%ebp)		#isrc++
		subl	$1,%ecx
		jmp		label_second_loop
		
	label_copy:
		movl	12(%ebp),%esi
		movl	-8(%ebp),%ecx
		rep		movsb
		
		movb	$0,%al
		stosb
		
		movl	%ebp,%esp
		popl	%ebp
		ret
		
		

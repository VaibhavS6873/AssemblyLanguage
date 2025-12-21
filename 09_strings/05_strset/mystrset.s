.section .rodata
	msg_main_print1:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print2:
	.string	"\n\nEnter The Character To Set:\t"
	
	msg_main_print3:
	.string	"\n\nNow String Is:\t"
	
	msg_main_scan:
	.string	"%c"
	
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
		call 	gets
		
		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-21(%ebp),%eax
		movl	$msg_main_scan, (%esp)
		movl	%eax,4(%esp)
		call	scanf
		
		leal	-20(%ebp),%eax
		movb	-21(%ebp),%bl
		movl	%eax,(%esp)
		movb	%bl,4(%esp)
		call 	myStrset
		
		movl	$msg_main_print3,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		movl	$0,(%esp)
		call	exit
		
		
.globl	myStrset
.type 	myStrset,@function
myStrset:	
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$0,-4(%ebp)
		movl	8(%ebp),%esi		
		movl	8(%ebp),%edi
		movb	12(%ebp),%dl
		jmp		label_loop_condition
		
	label_loop:
		addl	$1,-4(%ebp)
		
	label_loop_condition:	
		lodsb
		cmpb	$0,%al
		jne		label_loop
		
		movb	%dl,%al
		movl	-4(%ebp),%ecx
		rep		stosb
	
		movl	%ebp,%esp
		popl	%ebp
		ret

.section .rodata
	msg_main_print1:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print2:
	.string	"\nString In Upper Case Is:\t"
	
	
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
		call	gets
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	myStrupr

		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		movl	$0,(%esp)
		call	exit
		
.globl	myStrupr
.type	myStrupr,@function
myStrupr:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	8(%ebp),%esi
		movl	8(%ebp),%edi
		
	label_loop:
		lodsb
		cmpb	$0,%al
		je		label_out
		cmpb	$'a',%al
		jl		label_skip
		cmpb	$'z',%al
		jg		label_skip
		subb	$32,%al
		
	label_skip:
		stosb
		jmp		label_loop
		
	label_out:
		movl	%ebp,%esp
		popl	%ebp
		ret
		

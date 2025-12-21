.section .rodata
	msg_main_print1:
	.string	"\nThe Length Of Hello Is %d\n"
	
	msg_main_print2:
	.string	"The Length of Good Is %d\n"
	
	msg_main_print3:
	.string	"The Length Of Morning Is %d\n"
	
	msg_main_pointer_string:
	.string	"Hello"
	
	msg_main_morning_string:
	.string	"Morning"
	
.section .text
.globl	main
.type 	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		leal	msg_main_pointer_string,%eax
		movl	%eax,-4(%ebp)
		
		movb	$'G',-9(%ebp)
		movb	$'o',-8(%ebp)
		movb	$'o',-7(%ebp)
		movb	$'d',-6(%ebp)
		movb	$0,-5(%ebp)
		
		movl	-4(%ebp),%eax
		movl	%eax,(%esp)
		call	myStrlen
		movl	$msg_main_print1,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		leal	-9(%ebp),%ebx
		movl	%ebx,(%esp)
		call	myStrlen
		movl	$msg_main_print2,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		leal	msg_main_morning_string,%eax
		movl	%eax,(%esp)
		call	myStrlen
		movl	$msg_main_print3,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	$0,(%esp)
		call	exit
	
		
.globl	myStrlen
.type	myStrlen,@function
myStrlen:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	8(%ebp),%esi		#Take the address of string in esi
		movl	$0,-4(%ebp)
		jmp		label_while_condition
		
	label_while:
		addl	$1,-4(%ebp)
		
	label_while_condition:
		lodsb 						#loads from location whose address is in esi to al reg. 
		cmpb	$0,%al
		jne		label_while
		
		movl	-4(%ebp),%eax
		
		movl	%ebp,%esp
		popl	%ebp
		ret
		
		
	

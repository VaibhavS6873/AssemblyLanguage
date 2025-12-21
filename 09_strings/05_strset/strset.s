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
		call 	strset
		
		movl	$msg_main_print3,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
		movl	$0,(%esp)
		call	exit

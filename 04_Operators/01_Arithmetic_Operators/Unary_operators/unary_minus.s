.section .rodata
	msg_main_print:
	.string "%d\n"
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl	%esp,%ebp
	
	subl	$4,%esp
	movl 	$10,-4(%ebp)
	
	pushl 	$-100
	pushl	$msg_main_print
	call	printf
	addl	$8,%esp
	
	pushl 	-4(%ebp)
	pushl	$msg_main_print
	call	printf
	addl	$8,%esp
	
	movl	-4(%ebp),%eax
	negl	%eax
	pushl	%eax
	pushl	$msg_main_print
	call	printf
	addl	$8,%esp
	
	pushl 	-4(%ebp)
	pushl	$msg_main_print
	call	printf
	addl	$8,%esp
	
	pushl $0
	call exit
	
	

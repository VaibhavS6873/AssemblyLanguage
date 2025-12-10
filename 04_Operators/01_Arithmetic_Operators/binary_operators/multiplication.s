.section .rodata
	msg_main_print1:
	.string "Enter operand 1:\t"
	
	msg_main_print2:
	.string "Enter operand 2:\t"
	
	msg_main_print3:
	.string "Multiplication is = %d\n"
	
	msg_main_scan:
	.string "%d"
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl	%esp,%ebp
	
	subl	$12,%esp
	
	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp
	
	leal	-4(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp
	
	pushl	$msg_main_print2
	call	printf
	addl	$4,%esp
	
	leal	-8(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp
	
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%ecx
	mull	%ecx
	movl	%eax,-12(%ebp)
	
	pushl	%eax
	pushl	$msg_main_print3
	call	printf
	addl	$8,%esp
	
	pushl	$0
	call exit
	
	
	

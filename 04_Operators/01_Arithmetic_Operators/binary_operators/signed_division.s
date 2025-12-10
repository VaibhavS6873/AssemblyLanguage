.section .rodata
	msg_main_print1:
	.string "Enter numerator:\t"
	
	msg_main_print2:
	.string "Enter denominator:\t"
	
	msg_main_print3:
	.string "Quotient is = %d\n"
	
	msg_main_print4:
	.string "Remainder is = %d\n"
	
	msg_main_scan:
	.string "%d"
	
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl	%esp,%ebp
	
	subl	$16,%esp
	
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
	#xorl	%edx,%edx			#Numerator is considered as 64 bit and we are giving numerator which will required 32 bits , so zero out edx as it will get read
	cltd
	idivl	%ecx
	
	movl	%eax,-12(%ebp)
	movl	%edx,-16(%ebp)
	
	pushl	%eax
	pushl	$msg_main_print3
	call	printf
	addl	$8,%esp
	
	movl	-16(%ebp),%edx  	#It is done because printf/any other fun might alter the edx value during their operation
	pushl	%edx
	pushl	$msg_main_print4
	call	printf
	addl	$8,%esp
	
	pushl	$0
	call	exit
	
	

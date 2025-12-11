.section .rodata
	msg_main_print1:
	.string "Enter Number:\t"
	
	msg_main_print2:
	.string "Number is less than 2:\n"
	
	msg_main_print3:
	.string "Number is greater than 2:\n"
	
	msg_main_print4:
	.string "Number is 2:\n"
	
	msg_main_scan:
	.string "%d:\n"
	
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl 	$4,	%esp
	
	pushl	$msg_main_print1
	call	printf
	addl	$4,	%esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call 	scanf
	addl	$8, %esp
	
	movl	-4(%ebp), %eax
	cmpl	$2, %eax
	jge		label_else_if
	pushl	$msg_main_print2
	call 	printf
	addl	$4, %esp
	jmp		label_out
	
label_else_if:
	jle		label_else
	pushl	$msg_main_print3
	call 	printf
	addl	$4, %esp
	jmp		label_out
	
label_else:
	pushl	$msg_main_print4
	call 	printf
	addl	$4, %esp
	
label_out:
	pushl	$0
	call	exit

	

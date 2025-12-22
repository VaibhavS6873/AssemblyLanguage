.section .rodata
	msg_main_printf1:
	.string "Enter two numbers:\t"
	
	msg_main_printf2:
	.string "In main, %d %d %d\n"
	
	msg_main_scanf:
	.string "%d%d"
	
.section	.bss
	.comm	iNo2,4,4
	
.section	.data
	.globl	iNo1
	.type	iNo1, @object
	.size	iNo1,4
	.align	4
	iNo1:
		.int 10
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl 	%esp, %ebp
	
	subl 	$4, %esp
	
	pushl 	$msg_main_printf1
	call 	printf
	addl 	$4, %esp
	
	leal 	iNo2, %eax
	leal 	-4(%ebp), %edx
	pushl 	%edx
	pushl 	%eax
	pushl 	$msg_main_scanf
	call 	scanf
	addl 	$12, %esp
	
	movl 	iNo1, %eax
	movl 	iNo2, %edx
	movl 	-4(%ebp), %ecx
	pushl 	%ecx
	pushl 	%edx
	pushl 	%eax
	pushl 	$msg_main_printf2
	call  	printf	
	addl 	$16,%esp
	
	call 	fun1
	
	pushl 	$0
	call 	exit
	
	
	

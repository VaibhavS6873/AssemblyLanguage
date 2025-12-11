.section .rodata
	msg_main_print1:
	.string	"Enter the number:\t"
	
	msg_main_print2:
	.string	"Number is even \n"
	
	msg_main_print3:
	.string	"Number is odd \n"
	
	msg_main_scan:
	.string "%d"
	
.section .text
.globl	main
.type	main, @function
main:
		pushl	%ebp
		movl	%esp, %ebp
		
		subl	$4,	%esp
		
		pushl	$msg_main_print1
		call	printf
		addl	$4, %esp
		
		leal	-4(%ebp), %ebx
		pushl	%ebx
		pushl	$msg_main_scan
		call	scanf
		addl	$8,	%esp
		
		movl	-4(%ebp), %eax
		movl	$2,	%ecx
		xorl	%edx,%edx
		divl	%ecx
		cmpl	$0, %edx
		jne		label_else
		pushl	$msg_main_print2
		call	printf
		addl	$4,%esp
		jmp		label_out
		
label_else:
		pushl	$msg_main_print3
		call	printf
		addl	$4, %esp
		
label_out:	
		pushl	$0
		call exit

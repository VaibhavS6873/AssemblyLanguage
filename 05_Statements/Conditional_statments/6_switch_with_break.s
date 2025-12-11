.section .rodata
	msg_main_print1:
	.string "1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n"
	
	msg_main_print2:
	.string "Enter your choice:\t"
	
	msg_main_print3:
	.string "Addition\n"
	
	msg_main_print4:
	.string "Subtraction\n"
	
	msg_main_print5:
	.string "Multiplication\n"
	
	msg_main_print6:
	.string "Division\n"
	
	msg_main_print7:
	.string "Invalid choice\n"
	
	msg_main_scan:
	.string	"%d"
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$4, %esp
	
	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp
	
	pushl	$msg_main_print2
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	movl	-4(%ebp),%eax
	cmpl	$1, %eax
	je		label_switch_1
	cmpl	$2,%eax
	je		label_switch_2
	cmpl	$3,%eax
	je		label_switch_3
	cmpl	$4,%eax
	je		label_switch_4
	jmp		label_default
	
label_switch_1:
	pushl	$msg_main_print3
	call	printf
	addl	$4,%esp
	jmp	label_out
	
label_switch_2:
	pushl	$msg_main_print4
	call	printf
	addl	$4,%esp
	jmp		label_out
	
label_switch_3:
	pushl	$msg_main_print5
	call	printf
	addl	$4,%esp
	jmp		label_out
	
label_switch_4:
	pushl	$msg_main_print6
	call	printf
	addl	$4,%esp
	jmp		label_out
	
label_default:
	pushl	$msg_main_print7
	call	printf
	addl	$4,%esp

label_out:
	pushl	$0
	call	exit

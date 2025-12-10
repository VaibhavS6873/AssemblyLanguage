.section .rodata
	msg_main_print1:
	.string	"Enter iNo1:\t"
	
	msg_main_print2:
	.string	"Enter iNo2:\t"
	
	msg_main_print3:
	.string	"Enter iNo3:\t"
	
	msg_main_print4:
	.string "iNo1:%d\t\niNo2:%d\t\niNo3:%d\t\niAns:%d\t"
	
	msg_main_scan:
	.string "%d"
	
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print2
	call	printf
	addl	$4,%esp
	
	leal	-8(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print3
	call	printf
	addl	$4,%esp
	
	leal	-12(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %edx
	cmpl	%edx, %eax 
	jl		label_less_than_true
	movl	$0, %eax
	jmp		label_not_equal
	
label_less_than_true:
	movl	$1,%eax
	
label_not_equal:
	movl	-12(%ebp),%edx
	cmpl	%edx,%eax
	jne		label_not_equal_true
	movl	$0, %eax
	jmp		label_result

label_not_equal_true:
	movl	$1, %eax
	
label_result:
	movl	%eax,-16(%ebp)


	movl	-4(%ebp),%eax
	movl	-8(%ebp),%ebx
	movl	-12(%ebp),%ecx
	movl	-16(%ebp),%edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	$msg_main_print4
	call	printf
	addl	$20,%esp	
	pushl	$0
	call	exit

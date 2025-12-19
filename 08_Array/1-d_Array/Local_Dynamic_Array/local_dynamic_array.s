.section .rodata
	msg_main_print1:
	.string	"Enter value of n:\t"
	
	msg_main_print2:
	.string	"Enter %d value:\t"
	
	msg_main_print3:
	.string	"Entered elements are:\n"
	
	msg_main_print_values:
	.string	"%d value is:\t%d\n"
	
	msg_main_print_memFailed:
	.string	"Memory allocation FAILED"
	
	msg_main_scan:
	.string "%d"
	

	
.section .text
.globl	main
.type	main, @function
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
	
	movl	-4(%ebp),%eax
	movl	$4,%ecx
	mull	%ecx
	pushl	%eax 
	call	malloc   
	addl	$4,%esp
	movl	%eax, -12(%ebp)
	
	cmpl	$0,-12(%ebp)
	jne		label_for
	pushl	$msg_main_print_memFailed
	call	puts
	addl	$4,%esp
	pushl	$-1
	call	exit
	
label_for:
	movl	$0,-8(%ebp)
	jmp		label_for1_condition
	
label_for1:
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$8,%esp
	
	movl	-8(%ebp),%eax
	movl	-12(%ebp),%ebx
	leal	(%ebx,%eax,4), %edx
	pushl	%edx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp
	
	addl	$1, -8(%ebp)
	
label_for1_condition:
	movl	-8(%ebp),%eax
	movl	-4(%ebp),%edx
	cmpl	%edx,%eax
	jl		label_for1
	
	pushl	$msg_main_print3
	call	printf
	addl	$4,%esp
	
	movl	$0,-8(%ebp)
	jmp		label_for2_condition
	
label_for2:
	movl	-12(%ebp),%ebx
	movl	(%ebx,%eax,4),%edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_values
	call	printf
	addl	$12,%esp
	
	addl	$1, -8(%ebp)
	
label_for2_condition:
	movl	-8(%ebp),%eax
	movl	-4(%ebp),%edx
	cmpl	%edx,%eax
	jl		label_for2
	
	pushl	-12(%ebp)
	call	free
	movl	$0,-12(%ebp)
	
	pushl	$0
	call	exit
	

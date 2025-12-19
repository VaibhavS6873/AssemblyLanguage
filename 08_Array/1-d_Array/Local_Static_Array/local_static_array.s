.equ	MAX,10

.section .rodata
	msg_main_print1:
	.string	"Enter value of n(<%d):\t"
	
	msg_main_print2:
	.string	"Enter %d value:\t"
	
	msg_main_print3:
	.string	"%d value is:\t%d\n"
		
	msg_main_print4:
	.string	"Entered elements are:\n"
	
	msg_main_scan:
	.string	"%d"
	
.section .text
.globl	main
.type	main, @function
main:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$48,%esp
		
		pushl	$MAX
		pushl	$msg_main_print1
		call	printf
		addl	$8,%esp
		
		leal	-4(%ebp),%ebx
		pushl	%ebx
		pushl	$msg_main_scan
		call	scanf
		addl	$8,%esp
		
		movl	$0,-8(%ebp)
		jmp		label_for1_condition
		
label_for1:
	 pushl	%eax
	 pushl	$msg_main_print2
	 call	printf
	 addl	$8,%esp
	 
	 movl	-8(%ebp),%eax
	 leal	-48(%ebp,%eax,4), %ebx
	 pushl	%ebx
	 pushl	$msg_main_scan
	 call	scanf
	 addl	$8,%esp
	 
	 addl	$1,-8(%ebp)
	
label_for1_condition:
	movl	-8(%ebp),%eax
	movl	-4(%ebp),%edx
	cmpl	%edx,%eax
	jl		label_for1
	
	pushl	$msg_main_print4
	call	printf
	addl	$4,%esp
	
	movl	$0,-8(%ebp)
	jmp		label_for2_condition
		
label_for2:
	 movl	-48(%ebp,%eax,4), %edx
	 pushl	%edx
	 pushl	%eax
	 pushl	$msg_main_print3
	 call	printf
	 addl	$12,%esp
	 
	 addl	$1,-8(%ebp)
	
label_for2_condition:
	movl	-8(%ebp),%eax
	movl	-4(%ebp),%edx
	cmpl	%edx,%eax
	jl		label_for2
	
		
	pushl	$0
	call	exit
	

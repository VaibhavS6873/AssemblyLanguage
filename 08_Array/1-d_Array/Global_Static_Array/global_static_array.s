.equ	MAX,10

.section .rodata
	msg_main_print1:
	.string	"Enter value of n(<%d):\t"
	
	msg_main_print2:
	.string	"Enter %d value:\t"
	
	msg_main_print3:
	.string "arr1 is:\n"
	
	msg_main_print4:
	.string	"%d value is:\t%d\n"
		
	msg_main_print5:
	.string	"arr2 is:\n"
	
	msg_main_scan:
	.string	"%d"
	
.section .bss
	.comm	arr2,40
	
.section .data
	.globl	arr1
	.type arr1, @object
	.size arr1,12
	.align	4
arr1:
	.int 10,20,30
	
.section .text
.globl	main
.type	main, @function
main:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$8,%esp
		
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
	 leal	arr2(,%eax,4), %ebx
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
	
	pushl	$msg_main_print3
	call	printf
	addl	$4,%esp
	
	movl	$0,-8(%ebp)
	jmp		label_for2_condition
		
label_for2:
	 movl	arr1(,%eax,4), %edx
	 pushl	%edx
	 pushl	%eax
	 pushl	$msg_main_print4
	 call	printf
	 addl	$12,%esp
	 
	 addl	$1,-8(%ebp)
	
label_for2_condition:
	movl	-8(%ebp),%eax
	cmpl	$3,%eax
	jl		label_for2
	
	pushl	$msg_main_print5
	call	printf
	addl	$4,%esp
	
	movl	$0,-8(%ebp)
	jmp		label_for3_condition
		
label_for3:
	 movl	arr2(,%eax,4), %edx
	 pushl	%edx
	 pushl	%eax
	 pushl	$msg_main_print4
	 call	printf
	 addl	$12,%esp
	 
	 addl	$1,-8(%ebp)
	
label_for3_condition:
	movl	-8(%ebp),%eax
	movl	-4(%ebp),%edx
	cmpl	%edx,%eax
	jl		label_for3
		
	pushl	$0
	call	exit
	

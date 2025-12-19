.section .rodata
	msg_main_print1:
	.string "Enter value of rows & columns:\t"
	
	msg_main_print2:
	.string "Enter [%d][%d] value:\t"
	
	msg_main_print3:
	.string "Entered elements are:\n"
	
	msg_main_print4:
	.string "[%d][%d] value is:\t%d\n"
	
	msg_main_puts:
	.string	"Memory allocation FAILED"
	
	msg_main_scan1:
	.string "%d%d"
	
	msg_main_scan2:
	.string "%d"
	

.section .text
.globl	main
.type	main,@function
main:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$20,%esp
		
		pushl	$msg_main_print1
		call	printf
		addl	$4,%esp
		
		leal	-4(%ebp),%eax
		leal	-8(%ebp),%edx
		pushl	%edx
		pushl	%eax
		pushl	$msg_main_scan1
		call	scanf
		addl	$12,%esp
		
		movl	-4(%ebp),%eax
		movl	$4,%ecx
		mull	%ecx
		pushl	%eax
		call	malloc
		addl	$4,%esp
		movl	%eax,-20(%ebp)
		
		cmpl	$0,-20(%ebp)
		je		label_memory_failed
		
		movl	$0,-12(%ebp)
		jmp		label_for1_condition
		
		
label_for1:
		movl	-8(%ebp),%eax
		movl	$4,%ecx
		mull	%ecx
		pushl	%eax
		call	malloc
		addl	$4,%esp
		movl	-12(%ebp),%edx
		movl	-20(%ebp),%ebx
		movl	%eax,(%ebx,%edx,4)
		cmpl	$0,(%ebx,%edx,4)
		je		label_memory_failed
		
		movl	$0,-16(%ebp)
		jmp		label_for2_condition
		
		
	label_for2:
		movl	-12(%ebp),%eax
		pushl	%edx
		pushl	%eax
		pushl	$msg_main_print2
		call	printf
		addl	$12,%esp
		
		movl	-20(%ebp),%ebx
		movl	-12(%ebp),%eax
		movl	(%ebx,%eax,4),%ebx
		movl	-16(%ebp),%eax
		leal	(%ebx,%eax,4),%ebx
		pushl	%ebx
		pushl	$msg_main_scan2
		call	scanf
		addl	$8,%esp
			
		addl	$1,-16(%ebp)
		
	label_for2_condition:
		movl	-8(%ebp),%eax
		movl	-16(%ebp),%edx
		cmpl	%eax,%edx
		jl		label_for2
		
		
		addl	$1,-12(%ebp)
			

			
label_for1_condition:
		movl	-4(%ebp),%eax
		movl	-12(%ebp),%edx
		cmpl	%eax,%edx
		jl		label_for1		
		
		
		pushl	$msg_main_print3
		call	printf
		addl	$4,%esp
		
		#----------------------------#
		movl	$0,-12(%ebp)
		jmp		label_for1_condition_second
		
		
label_for1_second:	
		movl	$0,-16(%ebp)
		jmp		label_for2_condition_second
		
		
	label_for2_second:
		movl	-20(%ebp),%ebx
		movl	-12(%ebp),%eax
		movl	(%ebx,%eax,4),%ebx
		movl	(%ebx,%edx,4),%ebx
		pushl	%ebx
		pushl	%edx
		pushl	%eax
		pushl	$msg_main_print4
		call	printf
		addl	$16,%esp
			
		addl	$1,-16(%ebp)
		
	label_for2_condition_second:
		movl	-8(%ebp),%eax
		movl	-16(%ebp),%edx
		cmpl	%eax,%edx
		jl		label_for2_second
		
		
		addl	$1,-12(%ebp)
			
label_for1_condition_second:
		movl	-4(%ebp),%eax
		movl	-12(%ebp),%edx
		cmpl	%eax,%edx
		jl		label_for1_second
		

		movl	$0,-12(%ebp)
		jmp		label_for3_condition
		
		
label_for3:
		movl	-20(%ebp),%ebx
		movl	(%ebx,%edx,4),%ebx
		pushl	%ebx
		call	free
		movl	$0,%ebx
		addl	$1,-12(%ebp)
		
label_for3_condition:
		movl	-4(%ebp),%eax
		movl	-12(%ebp),%edx
		cmpl	%eax,%edx
		jl		label_for3	
		
		pushl	-20(%ebp)
		call	free
		movl	$0,-20(%ebp)
		

		pushl	$0
		call	exit
		
label_memory_failed:
		pushl	$msg_main_puts
		call	puts
		addl	$4,%esp
		pushl	$-1
		call	exit

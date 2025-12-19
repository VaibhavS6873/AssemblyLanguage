.equ	MAX,10

.section .rodata
	msg_main_print1:
	.string	"Enter value of rows & columns(< %d):\t"
	
	msg_main_print2:
	.string	"Enter [%d][%d] value:\t"
	
	msg_main_print3:
	.string	"Entered elements are:\n"
	
	msg_main_print4:
	.string	"[%d][%d] value is:\t%d\n"
	
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
		
		subl	$416,%esp
		
		pushl	$MAX
		pushl	$msg_main_print1
		call	printf
		addl	$8,%esp
		
		leal	-4(%ebp),%eax
		leal	-8(%ebp),%edx
		pushl	%edx
		pushl	%eax
		pushl	$msg_main_scan1
		call	scanf
		addl	$12,%esp
		
		movl	$0,-12(%ebp)
		jmp		label_for1_condition
		
label_for1:
		movl	$0,-16(%ebp)
		jmp		label_for2_condition
		
		label_for2:
			movl	-12(%ebp),%ecx
			pushl	%ebx
			pushl	%ecx
			pushl	$msg_main_print2
			call	printf
			addl	$12,%esp
			
			
			movl	-8(%ebp),%eax
			movl	$4,%ebx
			mull	%ebx
			movl	-12(%ebp),%ecx
			mull	%ecx
			movl	%eax,%esi #To store 1D array size
			leal	-416(%ebp),%edx
			addl	%eax,%edx
			movl	-16(%ebp),%ebx
			leal	(%edx,%ebx,4),%ebx
			pushl	%ebx
			pushl	$msg_main_scan2
			call	scanf
			addl	$8,%esp
			
			addl	$1,-16(%ebp)
			
			
			
		label_for2_condition:
			movl	-16(%ebp),%ebx
			movl	-8(%ebp),%edx
			cmpl	%edx,%ebx
			jl		label_for2
			
			
		addl	$1,-12(%ebp)


label_for1_condition:
		movl	-12(%ebp),%eax  
		movl	-4(%ebp),%edx
		cmpl	%edx,%eax
		jl		label_for1
	
		pushl	$msg_main_print3
		call	printf
		addl	$4,%esp
		
		# new
		
		movl	$0,-12(%ebp)
		jmp		label_for1_condition_second
		
label_for1_second:
		movl	$0,-16(%ebp)
		jmp		label_for2_condition_second
		
		label_for2_second:
			movl	-12(%ebp),%ecx
			movl	-8(%ebp),%eax
			movl	$4,%edx
			mull	%edx
			mull	%ecx
			leal	-416(%ebp),%edx
			addl	%eax,%edx
			movl	(%edx,%ebx,4),%edx
			pushl	%edx
			pushl	%ebx
			pushl	%ecx
			pushl	$msg_main_print4
			call	printf
			addl	$16,%esp
			
			addl	$1,-16(%ebp)
			
			
		label_for2_condition_second:
			movl	-16(%ebp),%ebx
			movl	-8(%ebp),%edx
			cmpl	%edx,%ebx
			jl		label_for2_second
			
			
		addl	$1,-12(%ebp)


label_for1_condition_second:
		movl	-12(%ebp),%eax
		movl	-4(%ebp),%edx
		cmpl	%edx,%eax
		jl		label_for1_second

		
		pushl	$0
		call	exit

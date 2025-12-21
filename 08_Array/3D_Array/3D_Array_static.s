.equ MAX1,5
.equ MAX2,10

.section .rodata
	msg_main_print1:
	.string "Enter value of planes, rows & columns(< %d, %d, %d):\t"
	
	msg_main_print2:
	.string "Enter [%d][%d][%d] value:\t"
	
	msg_main_print3:
	.string "Entered elements are:\n"
	
	msg_main_print4:
	.string	"[%d][%d][%d]value is:\t%d\n"
	
	msg_main_scan1:
	.string "%d%d%d"
	
	msg_main_scan2:
	.string "%d"
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16, %esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$2048, %esp
		
		movl	$msg_main_print1,(%esp)
		movl	$MAX1,4(%esp)
		movl	$MAX2,8(%esp)
		movl	$MAX2,12(%esp)
		call	printf
		
		leal	-4(%ebp),%eax
		leal	-8(%ebp),%ebx
		leal	-12(%ebp),%edx
		movl	$msg_main_scan1,(%esp)
		movl	%eax,4(%esp)
		movl	%ebx,8(%esp)
		movl	%edx,12(%esp)
		call	scanf
		
		movl	$0,-16(%ebp)
		jmp		label_for1_condition
		
label_for1:
		movl	$0,-20(%ebp)
		jmp		label_for2_condition
		
		
	label_for2:
		movl	$0,-24(%ebp)
		jmp		label_for3_condition
		
		
	   label_for3:
	   	movl	-16(%ebp),%eax
	   	movl	-20(%ebp),%ebx
	   	movl	$msg_main_print2,(%esp)
	   	movl	%eax,4(%esp)
	   	movl	%ebx,8(%esp)
	   	movl	%edx,12(%esp)
	   	call	printf
	   	
	   	movl	-12(%ebp),%eax
	   	movl	$4,%ebx
	   	mull	%ebx
	   	movl	%eax,%esi #To store 1D array size
	   	movl	-8(%ebp),%ecx
	   	mull	%ecx
	   	movl	-16(%ebp),%ebx
	   	mull	%ebx
	   	leal	-2024(%ebp),%edi
	   	addl	%eax,%edi
	   	
	   	movl	-20(%ebp),%eax
	   	mull	%esi
	   	addl	%eax,%edi
	   	movl	-24(%ebp),%eax
	   	leal	(%edi,%eax,4),%ebx
	   	movl	$msg_main_scan2,(%esp)
	   	movl	%ebx,4(%esp)
	   	call	scanf
	   	
	   	addl	$1,-24(%ebp)
	   	
	  
	   label_for3_condition:
	   	movl	-12(%ebp),%ecx
	   	movl	-24(%ebp),%edx
	   	cmpl	%ecx,%edx
	   	jl		label_for3
		
		
		addl	$1,-20(%ebp)
	label_for2_condition:
		movl	-8(%ebp),%ebx
		movl	-20(%ebp),%edx
		cmpl	%ebx,%edx
		jl		label_for2
	
	
		addl	$1,-16(%ebp)
		
label_for1_condition:
	movl	-4(%ebp),%eax
	movl	-16(%ebp),%edx
	cmpl	%eax,%edx
	jl		label_for1
		
	
	movl	$msg_main_print3,(%esp)
	call	printf
	
	
	#--------------------new--------------------------------
	movl	$0,-16(%ebp)
	jmp		label_for1_condition_second
		
label_for1_second:
		movl	$0,-20(%ebp)
		jmp		label_for2_condition_second
		
		
	label_for2_second:
		movl	$0,-24(%ebp)
		jmp		label_for3_condition_second
		
		
	   label_for3_second:   	
	   	movl	-12(%ebp),%eax
	   	movl	$4,%ebx
	   	mull	%ebx
	   	movl	%eax,%esi #To store 1D array size
	   	movl	-8(%ebp),%ecx
	   	mull	%ecx
	   	movl	-16(%ebp),%ebx
	   	mull	%ebx
	   	leal	-2024(%ebp),%edi
	   	addl	%eax,%edi
	   	
	   	movl	-20(%ebp),%eax
	   	mull	%esi
	   	addl	%eax,%edi
	   	movl	-24(%ebp),%eax
	   	movl	(%edi,%eax,4),%ebx
	   	movl	-16(%ebp),%eax
	   	movl	-20(%ebp),%ecx
	   	movl	-24(%ebp),%edx
	   	movl	$msg_main_print4,(%esp)
	   	movl	%eax,4(%esp)
	   	movl	%ecx,8(%esp)
	   	movl	%edx,12(%esp)
	   	movl	%ebx,16(%esp)
	   	call	printf
	   	
	   	addl	$1,-24(%ebp)
	   	
	  
	   label_for3_condition_second:
	   	movl	-12(%ebp),%ecx
	   	movl	-24(%ebp),%edx
	   	cmpl	%ecx,%edx
	   	jl		label_for3_second
		
		
		addl	$1,-20(%ebp)
	label_for2_condition_second:
		movl	-8(%ebp),%ebx
		movl	-20(%ebp),%edx
		cmpl	%ebx,%edx
		jl		label_for2_second
	
	
		addl	$1,-16(%ebp)
		
label_for1_condition_second:
	movl	-4(%ebp),%eax
	movl	-16(%ebp),%edx
	cmpl	%eax,%edx
	jl		label_for1_second
		
	movl	$0,(%esp)
	call	exit

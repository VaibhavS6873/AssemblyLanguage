.section .rodata
	msg_main_print1:
	.string "argc is %d\n\n"
	
	msg_main_print2:
	.string	"Invalid arguments:prog_name no1 no2"
	
	msg_main_print3:
	.string	"Values are:"
	
	msg_main_print4:
	.string "\n"
	
	msg_main_print5:
	.string	"Envp values are:"
	
	msg_main_print6:
	.string	"Sum is %d\n"
	
	
.section .text
.globl	main
.type	main,@function
main:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	4(%ebp),%eax
		
		movl	$msg_main_print1,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		cmpl	$3,4(%ebp)
		je		label_next
		movl	$msg_main_print2,(%esp)
		call	puts
		jmp		label
		
	label_next:
		movl	$msg_main_print3,(%esp)
		call	puts
		
		movl	$0,-4(%ebp)
		jmp		label_condition1
		
	label_for1:
		leal	8(%ebp),%edx
		movl	(%edx,%ebx,4),%eax
		movl	%eax,(%esp)
		call	puts
		
		addl	$1,-4(%ebp)
		
	label_condition1:
		movl	-4(%ebp),%ebx
		cmpl	4(%ebp),%ebx
		jl		label_for1
		
		movl	$msg_main_print4,(%esp)
		call	printf
		
		movl	12(%ebp),%eax
		movl	%eax,(%esp)
		call	atoi
		
		movl	%eax,%ebx
		
		movl	16(%ebp),%eax
		movl	%eax,(%esp)
		call	atoi
		
		movl	%eax,%edx
		
		addl	%edx,%ebx
		movl	%ebx,-8(%ebp)
		
		
	label:
		movl	$msg_main_print5,(%esp)
		call	puts
		
		movl	$0,-4(%ebp)
		jmp		label_condition2
		
	label_for2:
		movl	(%eax,%edx,4),%ebx
		movl	%ebx, (%esp)
		call	puts
		
		addl	$1,-4(%ebp)
	label_condition2:
		leal	24(%ebp),%eax
		movl	-4(%ebp),%edx
		movl	(%eax,%edx,4),%ebx
		cmpl	$0,%ebx
		jne		label_for2
		
		movl	-8(%ebp),%eax
		movl	$msg_main_print6,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	$0,(%esp)
		call	exit

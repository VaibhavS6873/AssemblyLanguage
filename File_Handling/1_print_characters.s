.section .rodata
	msg_main_print1:
	.string	"print_characters.txt"
	
	msg_main_print2:
	.string	"r"
	
	msg_main_print3:
	.string	"\nCan't Open File\n"
	
	msg_main_print4:
	.string	"%c"
	
	
.section .text
.globl	main
.type 	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$0,-4(%ebp)
		
		movl	$msg_main_print1,(%esp)
		movl	$msg_main_print2,4(%esp)
		call	fopen
		movl	%eax,-4(%ebp)
		
		cmpl	$0,-4(%ebp)
		jne		label_while
		movl	$msg_main_print3,(%esp)
		call	printf
		movl	$-1,(%esp)
		call	exit
		
		
	label_while:
		movl	-4(%ebp),%edx
		movl	%edx,(%esp)
		call	fgetc
		movl	%eax,-8(%ebp)
		cmpl	$-1,-8(%ebp)
		je		label_while_end
		movl	$msg_main_print4,(%esp)
		movl	%eax,4(%esp)
		call	printf
		jmp		label_while
		
	label_while_end:
		movl	-4(%ebp),%edx
		movl	%edx,(%esp)
		call	fclose
		movl	$0,-4(%ebp)
		
		movl	$0,(%esp)
		call	exit
		

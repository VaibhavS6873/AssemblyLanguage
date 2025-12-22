.section .rodata
	msg_main_print1:
	.string	"chars_spaces_tabs_newlines_count.txt"
	
	msg_main_print2:
	.string "r"
	
	msg_main_print3:
	.string	"Cant Open The File"
	
	msg_main_print4:
	.string	"\nNo of characters are %d\n"
	
	msg_main_print5:
	.string	"No of spaces are %d\n"
	
	msg_main_print6:
	.string	"No of tabs are %d\n"
	
	msg_main_print7:
	.string	"No of lines are %d\n"
	
	
	
	
.section .text
.globl	main
.type 	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		movl	$0,-4(%ebp)
		movl	$0,-8(%ebp)
		movl	$0,-12(%ebp)
		movl	$0,-16(%ebp)
		movl	$0,-20(%ebp)
		
		movl	$msg_main_print1,(%esp)
		movl	$msg_main_print2,4(%esp)
		call	fopen
		movl	%eax,-4(%ebp)
		
		cmpl	$0,%eax
		jne		label_while
		movl	$msg_main_print3,(%esp)
		call	printf
		movl	$0,(%esp)
		call	exit
		
	label_while:
		movl	-4(%ebp),%ebx
		movl	%ebx,(%esp)
		call	fgetc
		movl	%eax,-24(%ebp)
		cmpl	$-1,%eax
		je		label_while_end
		addl	$1,-8(%ebp)
		cmpl	$32,-24(%ebp)
		jne		label_else_if1
		addl	$1,-12(%ebp)
		jmp		label_while
		
	 label_else_if1:
	 	cmpl	$9,-24(%ebp)
	 	jne		label_else_if2
	 	addl	$1,-16(%ebp)
	 	jmp		label_while
	 	
	 label_else_if2:
	 	cmpl	$10,-24(%ebp)
	 	jne		label_while
		addl	$1,-20(%ebp)
		jmp		label_while				
		
		
	label_while_end:
		movl	-4(%ebp),%eax
		movl	%eax,(%esp)
		call	fclose
		movl	$0,-4(%ebp)
		
		movl	-8(%ebp),%eax
		movl	$msg_main_print4,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	-12(%ebp),%eax
		movl	$msg_main_print5,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	-16(%ebp),%eax
		movl	$msg_main_print6,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	-20(%ebp),%eax
		movl	$msg_main_print7,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	$0,(%esp)
		call	exit
		

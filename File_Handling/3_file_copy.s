.section .rodata
	msg_main_print1:
	.string	"file_copy_source.txt"
	
	msg_main_print2:
	.string "r"
	
	msg_main_print3:
	.string	"Cant Open Source File"
	
	msg_main_print4:
	.string	"file_copy_destination.txt"
	
	msg_main_print5:
	.string "w"
	
	msg_main_print6:
	.string	"Cant Open Destination File"
	
	msg_main_print7:
	.string	"\nCopied Successfully\n"
	
	
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
		
		movl	$msg_main_print1,(%esp)
		movl	$msg_main_print2,4(%esp)
		call	fopen
		movl	%eax,-4(%ebp)
		
		cmpl	$0,%eax
		jne		label_next
		movl	$msg_main_print3,(%esp)
		call	printf
		movl	$-1,(%esp)
		call	exit

	label_next:
		movl	$msg_main_print4,(%esp)
		movl	$msg_main_print5,4(%esp)
		call	fopen
		movl	%eax,-8(%ebp)
		
		cmpl	$0,%eax
		jne		label_while
		movl	$msg_main_print6,(%esp)
		call	printf
		movl	-4(%ebp),%eax
		movl	%eax,(%esp)
		call	fclose
		movl	$0,-4(%ebp)
		movl	$0,(%esp)
		call	exit
		
	label_while:
		movl	-4(%ebp),%ebx
		movl	%ebx,(%esp)
		call	fgetc
		movl	%eax,-12(%ebp)
		cmpl	$-1,%eax
		je		label_while_end
		movl	-8(%ebp),%eax
		movl	-12(%ebp),%edx
		movl	%edx,(%esp)
		movl	%eax,4(%esp)
		call	fputc
		jmp		label_while
		
	label_while_end:
		movl	-4(%ebp),%eax
		movl	%eax,(%esp)
		call	fclose
		movl	$0,-4(%esp)
		
		movl	-8(%ebp),%eax
		movl	%eax,(%esp)
		call	fclose
		movl	$0,-8(%esp)
		
		movl	$msg_main_print7,(%esp)
		call	printf
		
		movl	$0,(%esp)
		call	exit
		
	

.section .rodata
	msg_main_print1:
	.string	"student_structure_from_file_to_screen.txt"
	
	msg_main_print2:
	.string "r"
	
	msg_main_print3:
	.string	"\nCant Open File\n"
	
	msg_main_print4:
	.string	"%s %d %f\n"
	
	msg_main_scan1:
	.string	"%s %d %f"
	
	
.section .text
.globl	main
.type 	main,@function
main:
		andl	$-16, %esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$80,%esp
		
		movl	$0,-4(%ebp)
		
		movl	$msg_main_print1,(%esp)
		movl	$msg_main_print2,4(%esp)
		call	fopen
		movl	%eax,-4(%ebp)
		
		cmpl	$0,%eax
		jne		label_while_condition
		movl	$msg_main_print3,(%esp)
		call	printf
		movl	$-1,(%esp)
		call	exit
		
	label_while:
		leal	-52(%ebp),%eax
		movl	-12(%ebp),%edx
		flds	-8(%ebp)
		movl	$msg_main_print4,(%esp)
		movl	%eax,4(%esp)
		movl	%edx,8(%esp)
		fstpl	12(%esp)
		call	printf
		
	label_while_condition:
		leal	-52(%ebp),%eax
		leal	-12(%ebp),%edx
		leal	-8(%ebp),%ebx
		movl	-4(%ebp),%ecx
		movl	%ecx,(%esp)
		movl	$msg_main_scan1,4(%esp)
		movl	%eax,8(%esp)
		movl	%edx,12(%esp)
		movl	%ebx,16(%esp)
		call	fscanf
		cmpl	$-1,%eax
		jne		label_while
		
		movl	-4(%ebp),%eax
		movl	%eax,(%esp)
		call	fclose
		movl	$0,-4(%ebp)
		
		movl	$0,(%esp)
		call	exit
		
		
		

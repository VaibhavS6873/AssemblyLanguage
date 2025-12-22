.section .rodata
	msg_main_print1:
	.string	"student_structure_from_keyboard_to_file.txt"
	
	msg_main_print2:
	.string	"w"
	
	msg_main_print3:
	.string	"\nCant Open File\n"
	
	msg_main_print4:
	.string	"\n\nEnter name,rollno. and percentage:\n"
	
	msg_main_print5:
	.string	"%s %d %f\n"
	
	msg_main_print6:
	.string	"\nAdd another record (Y/N)"
	
	msg_main_scan1:
	.string "%s %d %f"
	
	msg_main_scan2:
	.string "%c%c"
	
	
.section .text
.globl	main
.type 	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$80,%esp
		
		movl	$0,-4(%ebp)
		movb	$'Y',-5(%ebp)
		
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
		movl	$msg_main_print4,(%esp)
		call	printf
		
		leal	-53(%ebp),%eax
		leal	-13(%ebp),%edx
		leal	-9(%ebp),%ebx
		movl	$msg_main_scan1,(%esp)
		movl	%eax,4(%esp)
		movl	%edx,8(%esp)
		movl	%ebx,12(%esp)
		call	scanf
		
		
		leal	-53(%ebp),%eax
		movl	-4(%ebp),%edx
		movl	%eax,(%esp)
		movl	$48,4(%esp)
		movl	$1,8(%esp)
		movl	%edx,12(%esp)
		call	fwrite
		
		movl	$msg_main_print6,(%esp)
		call	printf
		
		leal	-54(%ebp),%eax
		leal	-5(%ebp),%edx
		movl	$msg_main_scan2,(%esp)
		movl	%eax,4(%esp)
		movl	%edx,8(%esp)
		call	scanf
		
	label_while_condition:
		cmpb	$'Y',-5(%ebp)
		je		label_while
		cmpb	$'y',-5(%ebp)
		je		label_while
		
		movl	-4(%ebp),%eax
		movl	%eax,(%esp)
		call	fclose
		
		movl	$0,-4(%ebp)
		
		movl	$0,(%esp)
		call	exit		
		

.section .rodata
	msg_main_print_obj1:
	.string "\nobj1 is\n"
	
	msg_main_print_obj2:
	.string	"obj2 is\n"
	
	msg_main_print_obj3:
	.string	"obj3 is\n"
	
	msg_main_obj2_values:
	.string "Enter obj2 values, \n"
	
	msg_main_char:
	.string	"Enter chChar \t:"
	
	msg_main_int:
	.string "Enter iNo\t:"
	
	msg_main_sint:
	.string "Enter shiNo\t:"
	
	msg_main_values:
	.string "chChar = %c, iNo = %d, shiNo = %hd\n"
	
	msg_main_scanChar:
	.string	"%c"
	
	msg_main_scanInt:
	.string	"%d"
	
	msg_main_scanSint:
	.string	"%hd"
	
.section .bss
	.comm	obj1 12,4
	
.section .text
.globl	main
.type main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$24, %esp
	
	pushl	$msg_main_obj2_values
	call	printf
	addl	$4,%esp
	
	pushl	$msg_main_char
	call	printf
	addl	$4,%esp
	
	leal	-12(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scanChar
	call	scanf
	addl	$8,%esp
	
	pushl	$msg_main_int
	call	printf
	addl	$4,%esp
	
	leal	-8(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scanInt
	call	scanf
	addl	$8,%esp
	
	pushl	$msg_main_sint
	call	printf
	addl	$4,%esp
	
	leal	-4(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scanSint
	call	scanf
	addl	$8,%esp
	
	pushl	$msg_main_print_obj2
	call	printf
	addl 	$4,%esp
	
	leal	-12(%ebp),%ebx
	xorl	%eax,%eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx,%ecx
	movw	8(%ebx),%cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_values
	call	printf
	addl	$16,%esp
	
	leal	obj1, %ebx
	movl	-12(%ebp),%eax
	movl	%eax, (%ebx)
	movl	-8(%ebp),%eax
	movl	%eax,4(%ebx)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%ebx)
	
	leal	-24(%ebp),%ebx
	movl	-12(%ebp),%eax
	movl	%eax, (%ebx)
	movl	-8(%ebp),%eax
	movl	%eax,4(%ebx)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%ebx)
	
	pushl	$msg_main_print_obj1
	call	printf
	addl 	$4,%esp
	
	leal	obj1,%ebx
	xorl	%eax,%eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx,%ecx
	movw	8(%ebx),%cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_values
	call	printf
	addl	$16,%esp
	
	pushl	$msg_main_print_obj3
	call	printf
	addl 	$4,%esp
	
	leal	-24(%ebp),%ebx
	xorl	%eax,%eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx,%ecx
	movw	8(%ebx),%cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_values
	call	printf
	addl	$16,%esp
	
	pushl	$0
	call 	exit

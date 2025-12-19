.section .rodata
	msg_main_print1:
	.string	"Enter obj1 values,\n"
	
	msg_main_print2:
	.string "Enter chChar\t:"
	
	msg_main_print3:
	.string	"Enter iNo\t:"
	
	msg_main_print4:
	.string	"Enter shiNo\t:"
	
	msg_main_print5:
	.string	"Enter obj2 values, \n"
	
	msg_main_scan1:
	.string "%c"
	
	msg_main_scan2:
	.string	"%d"
	
	msg_main_scan3:
	.string	"%hd"
	
	msg_main_scan4:
	.string	"%c%c"
	
	msg_main_scan5:
	.string	"%c%d"
	
	msg_main_scan6:
	.string	"%c%hd"
	
	msg_main_obj1:
	.string	"obj1 is\n"
	
	msg_main_obj2:
	.string	"obj2 is\n"
	
	msg_main_obj1_data:
	.string	"chChar = %c, iNo = %d, shiNo = %hd\n\n"
	
	msg_main_obj2_data:
	.string	"chChar = %c, iNo = %d, shiNo = %hd\n"
	
.section .bss
	.comm	obj1 12,4
	
.section .text
.globl	main
.type	main, @function
main:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$13,%esp
		
		pushl	$msg_main_print1
		call	printf
		addl	$4,%esp
		
		pushl	$msg_main_print2
		call	printf
		addl	$4,%esp
		
		leal	obj1,%ebx
		pushl	%ebx
		pushl	$msg_main_scan1
		call	scanf
		addl	$8,%esp
		
		pushl	$msg_main_print3
		call	printf
		addl	$4,%esp
		
		leal	4(%ebx),%eax
		pushl	%eax
		pushl	$msg_main_scan2
		call	scanf
		addl	$8,%esp
		
		pushl	$msg_main_print4
		call	printf
		addl	$4,%esp
		
		leal	8(%ebx),%eax
		pushl	%eax
		pushl	$msg_main_scan3
		call	scanf
		addl	$8,%esp
		
		pushl	$msg_main_print5
		call	printf
		addl	$4,%esp
		
		pushl	$msg_main_print2
		call	printf
		addl	$4,%esp
		
		leal	-12(%ebp),%ebx
		leal	-13(%ebp),%edx
		pushl	%ebx
		pushl	%edx
		pushl	$msg_main_scan4
		call	scanf
		addl	$12,%esp
		
		pushl	$msg_main_print3
		call	printf
		addl	$4,%esp
		
		leal	4(%ebx),%eax
		leal	-13(%ebp),%edx
		pushl	%eax
		pushl	%edx
		pushl	$msg_main_scan5
		call	scanf
		addl	$12,%esp
		
		pushl	$msg_main_print4
		call	printf
		addl	$4,%esp
		
		leal	8(%ebx),%eax
		leal	-13(%ebp),%edx
		pushl	%eax
		pushl	%edx
		pushl	$msg_main_scan6
		call	scanf
		addl	$12,%esp
		
		pushl	$msg_main_obj1
		call	printf
		addl	$4,%esp
		
		leal	obj1,%ebx
		xorl	%eax,%eax
		movb	(%ebx),%al
		movl	4(%ebx),%edx
		xorl	%ecx,%ecx
		movw	8(%ebx),%cx
		pushl	%ecx
		pushl	%edx
		pushl	%eax
		pushl	$msg_main_obj1_data
		call	printf
		addl	$16, %esp
		
		pushl	$msg_main_obj2
		call	printf
		addl	$4,%esp
		
		leal	-12(%ebp),%ebx
		xorl	%eax,%eax
		movb	(%ebx),%al
		movl	4(%ebx),%edx
		xorl	%ecx,%ecx
		movw	8(%ebx),%cx
		pushl	%ecx
		pushl	%edx
		pushl	%eax
		pushl	$msg_main_obj2_data
		call	printf
		addl	$16, %esp
		
		pushl	$0
		call	exit

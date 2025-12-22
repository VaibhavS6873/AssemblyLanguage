.section .rodata
	msg_main_print1:
	.string	"Hello\n"
	
	msg_main_print2:
	.string	"printf returned %d\n"
	
	msg_main_print3:
	.string	"%d\n"
	
	msg_main_print4:
	.string	"%d\t%c\n"
	
	msg_main_print5:
	.string	"%c\t%d\n"
	
	msg_main_print6:
	.string	"%c\t%d\t%f\t%lf\n"
	
	msg_main_print7:
	.string	"Answer is %d\n"

	msg_main_float:
	.float 57.33
	
	msg_main_double:
	.double 69.33	
	
.section .text
.globl	main
.type main,@function
main:
		andl	$-16, %esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		movl	$msg_main_print1,(%esp)
		call	myprintf
		movl	%eax,-4(%ebp)
		
		movl	$msg_main_print2,(%esp)
		movl	%eax,4(%esp)
		call	myprintf
		
		movl	$msg_main_print3,(%esp)
		movl	$10,4(%esp)
		call	myprintf
		
		movl	$msg_main_print4,(%esp)
		movl	$10, 4(%esp)
		movl	$'A',8(%esp)
		call	myprintf
		
		movl	$msg_main_print5,(%esp)
		movl	$'A', 4(%esp)
		movl	$10,8(%esp)
		call	myprintf
		
		fldl	msg_main_double
		flds	msg_main_float
		movl	$msg_main_print6, (%esp)
		movl	$'A', 	4(%esp)
		movl	$10,	8(%esp)
		fstpl	12(%esp)
		fstpl	20(%esp)
		call	myprintf
		
		movl	$2,(%esp)
		movl	$10,4(%esp)
		movl	$20,8(%esp)
		call	Addition
		movl	%eax,-4(%ebp)
		
		movl	$msg_main_print7,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	$3,(%esp)
		movl	$10,4(%esp)
		movl	$20,8(%esp)
		movl	$30,12(%esp)
		call	Addition
		movl	%eax,-4(%ebp)
		
		movl	$msg_main_print7,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	$4,(%esp)
		movl	$10,4(%esp)
		movl	$20,8(%esp)
		movl	$30,12(%esp)
		movl	$40,16(%esp)
		call	Addition
		movl	%eax,-4(%ebp)
		
		movl	$msg_main_print7,(%esp)
		movl	%eax,4(%esp)
		call	printf
		
		movl	$0,(%esp)
		call	exit
		
		
.globl	myprintf
.type  	myprintf,@function
myprintf:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$0,-8(%ebp)
		leal	12(%ebp),%ebx
		movl	%ebx,-8(%ebp)
		
		movl	 8(%ebp),%eax
		movl	 %eax,(%esp)
		movl	-8(%ebp),%eax
		movl	%eax,4(%esp)
		call	vprintf
		
		movl	$0,-8(%ebp)
		
		movl	%ebp,%esp
		popl	%ebp
		ret
		
		
.globl	Addition
.type	Addition,@function
Addition:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$0,-12(%ebp)
		leal	12(%ebp),%ebx
		movl	%ebx,-12(%ebp)
		
		movl	$0,-4(%ebp)
		movl	$0,-8(%ebp)
		
	label_for:
		movl	-12(%ebp),%ebx
		movl	-4(%ebp),%edx
		addl	(%ebx),%edx
		movl	%edx,-4(%ebp)
		addl	$4,-12(%ebp)
		addl	$1,-8(%ebp)
		
	label_condition:
		movl	-8(%ebp),%eax
		movl	 8(%ebp),%edx
		cmpl	 %edx,%eax
		jl		 label_for
		
		movl	-4(%ebp),%eax
		
		movl	%ebp,%esp
		popl	%ebp
		ret

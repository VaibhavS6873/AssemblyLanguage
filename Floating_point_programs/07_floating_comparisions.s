.section .rodata
	msg_main_print1:
	.string	"Enter two floating point numbers:\t"
	
	msg_main_print2:
	.string	"fNo1 is less than fNo2"
	
	msg_main_print3:
	.string	"fNo1 is greater than fNo2"
	
	msg_main_print4:
	.string	"values are equal"
	
	msg_main_scan:
	.string	"%f%f"
	
.section .text
.globl	main
.type	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-8(%ebp),%eax
		leal	-12(%ebp),%edx
		movl	$msg_main_scan,(%esp)
		movl	%eax,4(%esp)
		movl	%edx,8(%esp)
		call	scanf
		
		movl	-8(%ebp),%eax
		movl	-12(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	compare
		movl	%eax,-4(%ebp)
	
		cmpl	$-1,%eax
		jne		label_else_if
		movl	$msg_main_print2,(%esp)
		call	puts
		jmp		label_out
		
	label_else_if:
		cmpl	$1,%eax
		jne		label_else
		movl	$msg_main_print3,(%esp)
		call	puts
		jmp		label_out
		
	label_else:
		movl	$msg_main_print4,(%esp)
		call	puts
		
	label_out:
		movl	$0,(%esp)
		call	exit
		
		
		
		
.globl	compare
.type	compare,@function
compare:
		pushl	%ebp
		movl	%esp,%ebp
		
		flds	12(%ebp)	#fNo2 at st(1)
		flds	8(%ebp)		#fNo1 at st(0)
		
		fcompp	#compare st(0) with st(1) and pops two times
		fstsw	#[Store status word or store status] retrives status register from FPU to ax
		sahf	#stores ah to flags
		
		jae		label_else_if1
		movl	$-1,%eax
		jmp		label_exit
		
	label_else_if1:
		jbe		label_else1
		movl	$1,%eax
		jmp		label_exit
		
	label_else1:
		movl	$0,%eax
		
	label_exit:
		movl	%ebp,%esp
		popl	%ebp
		ret
		
		

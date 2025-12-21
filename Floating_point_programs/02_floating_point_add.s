.section .rodata
	msg_main_print1:
	.string "fNo1 = %f\tfNo2 = %f\n"
	
	msg_main_print2:
	.string	"fAns1 = %f\t\n"
	
	msg_main_print3:
	.string	"fAns2 = %f\t\n"
	
	int_value:
	.int 30
	
.section .data
	.globl	fNo1
	.type	fNo1,@object
	.size	fNo1,4
	.align	4
fNo1:
	.float	10.22
	
	.globl	fNo2
	.type	fNo2,@object
	.size	fNo2,4
	.align	4
fNo2:
	.float	20.22
	


.section .bss
	.comm	fAns1,4,4
	.comm	fAns2,4,4


.section .text
.globl	main
.type	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		movl	$msg_main_print1,(%esp)
		flds	fNo2
		flds	fNo1
		fstpl	4(%esp)
		fstpl	12(%esp)
		call	printf	
		
		flds	fNo1		#st(1)
		flds	fNo2		#st(0)
		fadd	%st(1),%st(0)	
		fstps	fAns1
		
		fiadds	int_value
		fstps	fAns2
		
		movl	$msg_main_print2,(%esp)
		flds	fAns1
		fstpl	4(%esp)
		call	printf
		
		movl	$msg_main_print3,(%esp)
		flds	fAns2
		fstpl	4(%esp)
		call	printf
		
		movl	$0,(%esp)
		call	exit
		
		
			

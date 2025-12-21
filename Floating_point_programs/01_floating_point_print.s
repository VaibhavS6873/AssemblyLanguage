.section .rodata
	msg_main_print1:
	.string "fNo1 = %f\tfNo2 = %f\n"
	
	msg_main_print2:
	.string "dNo1 = %lf\tdNo2 = %lf\n"
	
	
	
.section .data
	.globl	fNo1
	.type	fNo1,@object
	.size	fNo1,4
	.align	4
fNo1:
	.float	57.33
	
	.globl	dNo1
	.type	dNo1,@object
	.size	dNo1,8
	.align	4
dNo1:
	.double	58963.546
	


.section .bss
	.comm	fNo2,4,4
	.comm	dNo2,8,4
	
	
.section .text
.globl	main
.type	main,@function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		#Attempt 1 = failure
		#movl	$msg_main_print1,(%esp)
		#movl	fNo1,%eax
		#movl	fNo2,%edx
		#movl	%eax,4(%esp)
		#movl	%edx,8(%esp)
		#call	printf
		
		#Attempt 2 = failure
		#movl	$msg_main_print1,(%esp)
		#flds	fNo2
		#flds	fNo1
		#fstps	4(%esp)
		#fstps	8(%esp)
		#call	printf
		
		#Attempt 3 = Success
		movl	$msg_main_print1,(%esp)
		flds	fNo2
		flds	fNo1
		fstpl	4(%esp)
		fstpl	12(%esp)
		call	printf
		
		movl	$msg_main_print2,(%esp)
		fldl	dNo2
		fldl	dNo1
		fstpl	4(%esp)
		fstpl	12(%esp)
		call	printf
		
		movl	fNo1,%eax
		movl	%eax,fNo2
		
		fldl	dNo1
		fstpl	dNo2
		
		movl	$msg_main_print1,(%esp)
		flds	fNo2
		flds	fNo1
		fstpl	4(%esp)
		fstpl	12(%esp)
		call	printf
		
		movl	$msg_main_print2,(%esp)
		fldl	dNo2
		fldl	dNo1
		fstpl	4(%esp)
		fstpl	12(%esp)
		call	printf
		
		
		movl	$0,(%esp)
		call	exit

.section .rodata
	msg_main_obj1:
	.string "obj1 is\n"
	
	msg_main_obj2:
	.string	"obj2 is\n"
	
	msg_main_obj3:
	.string	"obj3 is\n"
	
	msg_main_obj_values:
	.string	"chChar = %c, iNo = %d, shiNo = %hd\n\n"
	
	msg_main_obj_comparision1:
	.string	"obj1 & obj2 comparison is "
	
	msg_main_obj_comparision2:
	.string	"obj2 & obj3 comparison is "
	
	msg_main_equal:
	.string	"equal\n"
	
	msg_main_not_equal:
	.string	"not equal\n"
	
.section .data
	.globl	obj1
	.type 	obj1, @function
	.size	obj1, 12
	.align	4
obj1:
	.ascii	"A"
	.zero	3
	.int	10
	.short	20
	
.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$24, %esp
	
	movb	$'B',-12(%ebp)
	movl	$30 ,-8(%ebp)
	movw	$40 ,-4(%ebp)
	
	movb	$'B',-24(%ebp)
	movl	$30 ,-20(%ebp)
	movw	$40 ,-16(%ebp)
	
	pushl	$msg_main_obj1
	call	printf
	addl	$4,%esp
	
	leal	obj1, %ebx
	xorl	%eax,%eax
	movb	(%ebx),%al
	movl	4(%ebx),%edx
	xorl	%ecx,%ecx
	movw	8(%ebx),%cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_obj_values
	call	printf
	addl	$16,%esp
	
	pushl	$msg_main_obj2
	call	printf
	addl	$4,%esp
	
	leal	-12(%ebp), %ebx
	xorl	%eax,%eax
	movb	(%ebx),%al
	movl	4(%ebx),%edx
	xorl	%ecx,%ecx
	movw	8(%ebx),%cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_obj_values
	call	printf
	addl	$16,%esp
	
	pushl	$msg_main_obj3
	call	printf
	addl	$4,%esp
	
	leal	-24(%ebp), %ebx
	xorl	%eax,%eax
	movb	(%ebx),%al
	movl	4(%ebx),%edx
	xorl	%ecx,%ecx
	movw	8(%ebx),%cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_obj_values
	call	printf
	addl	$16,%esp
	
	pushl	$msg_main_obj_comparision1
	call	printf
	addl	$4,%esp
	
	leal	obj1,%ebx
	movb	(%ebx), %al
	leal	-12(%ebp),%ecx
	movb	(%ecx),	%dl
	cmpb	%dl,%al
	jne		label_not_equal1
	movl	4(%ebx),%eax
	movl	4(%ecx),%edx
	cmpl	%edx,%eax
	jne		label_not_equal1
	movw	8(%ebx),%ax
	movw	8(%ecx),%dx
	cmpw	%dx,%ax
	jne		label_not_equal1
	pushl	$msg_main_equal
	call	printf
	addl	$4,%esp
	jmp		label_compare_another
	
label_not_equal1:
	pushl	$msg_main_not_equal
	call	printf
	addl	$4,%esp
	
	pushl	$msg_main_obj_comparision2
	call	printf
	addl	$4,%esp	
	
label_compare_another:
	leal	-24(%ebp),%ebx
	movb	(%ebx), %al
	leal	-12(%ebp),%ecx
	movb	(%ecx),	%dl
	cmpb	%dl,%al
	jne		label_not_equal2
	movl	4(%ebx),%eax
	movl	4(%ecx),%edx
	cmpl	%edx,%eax
	jne		label_not_equal2
	movw	8(%ebx),%ax
	movw	8(%ecx),%dx
	cmpw	%dx,%ax
	jne		label_not_equal2
	pushl	$msg_main_equal
	call	printf
	addl	$4,%esp
	jmp		label_out
	
label_not_equal2:
	pushl	$msg_main_not_equal
	call	printf
	addl	$4,%esp
	
label_out:
	pushl	$0
	call	exit
	

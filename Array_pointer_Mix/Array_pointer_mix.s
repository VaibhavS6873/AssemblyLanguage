.section .rodata
	msg_main_print1:
	.string "arr = %p \t *arr = %d \t &arr = %p\n"
	
	msg_main_print2:
	.string "p = %p \t *p = %p \t **p = %d\n"
	
	msg_main_print3:
	.string "ptr = %p \t *ptr = %p \t **ptr = %d\n"
	
	msg_main_print4:
	.string "ptr-p = %d \t *ptr-arr = %d \t **ptr = %d\n"
	
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$64,%esp
		
		leal	-40(%ebp),%eax
		movl	%eax,-44(%ebp)
		
		movl	$10,-20(%ebp)
		movl	$20,-16(%ebp)
		movl	$30,-12(%ebp)
		movl	$40,-8(%ebp)
		movl	$50,-4(%ebp)
		
		leal	-20(%ebp),%eax
		movl	%eax,-40(%ebp)
		leal	-16(%ebp),%eax
		movl	%eax,-36(%ebp)
		leal	-12(%ebp),%eax
		movl	%eax,-32(%ebp)
		leal	-8(%ebp),%eax
		movl	%eax,-28(%ebp)
		leal	-4(%ebp),%eax
		movl	%eax,-24(%ebp)
		
		leal	-20(%ebp),%eax
		movl	-20(%ebp),%edx
		movl	$msg_main_print1,(%esp)
		movl	%eax,4(%esp)
		movl	%edx,8(%esp)
		movl	%eax,12(%esp)
		call	printf
		
		leal	-40(%ebp),%eax
		movl	-40(%ebp),%edx
		movl	(%edx),%ebx
		movl	$msg_main_print2,(%esp)
		movl	%eax,4(%esp)
		movl	%edx,8(%esp)
		movl	%ebx,12(%esp)
		call	printf
		
		movl	-44(%ebp),%eax
		movl	(%eax),%edx
		movl	(%edx),%ebx
		movl	$msg_main_print3,(%esp)
		movl	%eax,4(%esp)
		movl	%edx,8(%esp)
		movl	%ebx,12(%esp)
		call	printf
		
		#--------------1st printf----------------------
		addl	$4,-44(%ebp)
		
		leal	-40(%ebp),%edx
		movl	-44(%ebp),%eax
		subl	%edx,%eax
		xorl	%edx,%edx
		movl	$4,%ecx
		divl	%ecx
		movl	%eax,%ebx     #ptr-p
		movl	-44(%ebp),%edx
		movl	(%edx),%eax
		leal	-20(%ebp),%edx
		subl	%edx,%eax
		xorl	%edx,%edx
		movl	$4,%ecx
		divl	%ecx
		movl	%eax,%ecx   #*ptr-arr
		movl	-44(%ebp),%eax
		movl	(%eax),%edx
		movl	(%edx),%eax  #**ptr
		movl	$msg_main_print4,(%esp)
		movl	%ebx,4(%esp)
		movl	%ecx,8(%esp)
		movl	%eax,12(%esp)
		call	printf
		
		#--------------2nd printf--------------------
		addl	$4,-44(%ebp)
		
		leal	-40(%ebp),%edx
		movl	-44(%ebp),%eax
		subl	%edx,%eax
		xorl	%edx,%edx
		movl	$4,%ecx
		divl	%ecx
		movl	%eax,%ebx     #ptr-p
		movl	-44(%ebp),%edx
		movl	(%edx),%eax
		leal	-20(%ebp),%edx
		subl	%edx,%eax
		xorl	%edx,%edx
		movl	$4,%ecx
		divl	%ecx
		movl	%eax,%ecx   #*ptr-arr
		movl	-44(%ebp),%eax
		movl	(%eax),%edx
		movl	(%edx),%eax  #**ptr
		movl	$msg_main_print4,(%esp)
		movl	%ebx,4(%esp)
		movl	%ecx,8(%esp)
		movl	%eax,12(%esp)
		call	printf
		
		
		#------------------3rd printf------------------
		movl	-44(%ebp),%eax
		movl	(%eax),%edx
		addl	$4,%edx
		movl	%edx,(%eax)  #++*ptr
		
		leal	-40(%ebp),%edx
		movl	-44(%ebp),%eax
		subl	%edx,%eax
		xorl	%edx,%edx
		movl	$4,%ecx
		divl	%ecx
		movl	%eax,%ebx     #ptr-p
		movl	-44(%ebp),%edx
		movl	(%edx),%eax
		leal	-20(%ebp),%edx
		subl	%edx,%eax
		xorl	%edx,%edx
		movl	$4,%ecx
		divl	%ecx
		movl	%eax,%ecx   #*ptr-arr
		movl	-44(%ebp),%eax
		movl	(%eax),%edx
		movl	(%edx),%eax  #**ptr
		movl	$msg_main_print4,(%esp)
		movl	%ebx,4(%esp)
		movl	%ecx,8(%esp)
		movl	%eax,12(%esp)
		call	printf
		
		movl	$0,(%esp)
		call	exit
		
		

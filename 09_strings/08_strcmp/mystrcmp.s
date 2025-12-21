.section .rodata
	msg_main_print1:
	.string	"\n\nEnter String1:\t"
	
	msg_main_print2:
	.string "\n\nEnter String2:\t"
	
	msg_main_print3:
	.string "\n\nBoth Strings Are Same\n"
	
	msg_main_print4:
	.string	"\n\nBoth Strings Are Diffrent\n"
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16, %esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$64,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-40(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		leal	-20(%ebp),%eax
		leal	-40(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	myStrcmp
		movl	%eax,-44(%ebp)
		
		movl	-44(%ebp),%eax
		cmpl	$0,%eax
		jne		label_else
		movl	$msg_main_print3,(%esp)
		call	printf
		jmp		label_next
		
label_else:
		movl	$msg_main_print4,(%esp)
		call	printf
		
label_next:		
		movl	$0,(%esp)
		call	exit
		
		
.globl	myStrcmp
.type	myStrcmp,@function
myStrcmp:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$0,-4(%ebp)
		movl	$0,-8(%ebp)
		movl	8(%ebp),%esi
		jmp		label_loop_condition
		
	label_loop:					#calculate size of first string
		addl	$1,-4(%ebp)
		
	label_loop_condition:	
		lodsb
		cmpb	$0,%al
		jne		label_loop
		
		movl	12(%ebp),%esi
		jmp		label_loop_condition1
		
	label_loop1:					#calculate size of second string
		addl	$1,-8(%ebp)
		
	label_loop_condition1:	
		lodsb
		cmpb	$0,%al
		jne		label_loop1
		
		
		movl	-4(%ebp), %eax
		movl	-8(%ebp), %edx
		cmpl	%edx,%eax
		jl		label_place
		movl	%eax,%ecx
		jmp		label_compare
		
	label_place:
		movl	%edx,%ecx
		
	label_compare:
		movl	8(%ebp),%esi
		movl	12(%ebp),%edi
		repe	cmpsb
		je		string_equal
		
		
		movb	-1(%esi),%al
		movb	-1(%edi),%dl
		movzx	%al,%eax
		movzx	%dl,%edx
		subl	%edx,%eax
		jmp		label_end
		
	string_equal:
		movl	$0,%eax
		
	label_end:
		movl	%ebp,%esp
		popl	%ebp
		ret

.section .rodata
	msg_main_print1:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print2:
	.string	"\n\nReverse String Is:\t"
	
	
.section .text
.globl	main
.type	main, @function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		movl	$msg_main_print1,(%esp)
		call	printf
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	gets
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	myStrrev

		movl	$msg_main_print2,(%esp)
		call	printf
		
		
		leal	-20(%ebp),%eax
		movl	%eax,(%esp)
		call	puts
		
	
		movl	$0,(%esp)
		call	exit
		
.globl	myStrrev
.type 	myStrrev,@function
myStrrev:
		pushl	%ebp
		movl	%esp,%ebp
	
		subl	$16,%esp
		
		movl	$0,-4(%ebp)	
		movl	$0,-8(%ebp)
		movl	8(%ebp),%esi
		movl	8(%ebp),%edi
		movl	%esi,%edx
		
	label_loop:
		addl	$1,-4(%ebp)
		
	label_loop_condition:
		lodsb
		cmpb	$0,%al
		jne		label_loop
		
		subl	$2,%esi  		#point to last 'v'
		movl	-4(%ebp),%ecx
		
		jmp		label_while_condition
		
	label_while:
		movb	(%esi),%bl
		movb	(%edi),%dl
		movb	%dl,(%esi)
		movb	%bl,(%edi)
		subl	$1,%esi
		addl	$1,%edi
		incl	%ecx
		decl	%eax
		
	label_while_condition:
		cmpl	%eax,%ecx
		jl		label_while
		
        
		movl	%ebp,%esp
		popl	%ebp
		ret
	
		
		

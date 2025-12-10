.section .rodata
	msg_main_print:
	.string " iNo1 = %d\n iNo2 = %d\n iAns1 = %d\n iAns2 = %d\n"
	
	
.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl 	%esp,%ebp
	
	subl	$16,%esp
	
	movl	$10,-4(%ebp)
	movl 	$20,-8(%ebp)
	
	addl 	$1,-4(%ebp) 	#++iNo1
	movl	-4(%ebp),%eax	#iNo1
	movl 	%eax,-12(%ebp)	#iAns1
	
	movl 	-8(%ebp),%edx	#iNo2
	movl 	%edx,-16(%ebp)	#iAns2
	addl	$1,-8(%ebp)		#iNo2++
	
	movl	-8(%ebp),%ecx
	pushl 	%edx
	pushl	%eax
	pushl	%ecx
	pushl	%eax
	pushl	$msg_main_print
	call	printf
	addl	$20,%esp
	
	pushl $0
	call exit

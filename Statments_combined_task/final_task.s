.section .rodata
	msg_main_print1:
	.string	"\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit\n"
	
	msg_main_print2:
	.string	"Enter your choice:\t"
	
	msg_main_print3:
	.string	"Enter two numbers:\t"
	
	msg_main_print4:
	.string	"Enter valid choice\n"
	
	msg_main_print5:
	.string "Answer is %d\n\n"
	
	msg_main_print6:
	.string	"Are you want to enter more choice(1\\0):\t"
	
	msg_main_scan1:
	.string	"%d"
	
	msg_main_scan2:
	.string	"%d%d"
	
.section .text
.globl	main
.type	main,@function
main:
	pushl	%ebp
	movl	%esp,%ebp
	
	subl	$16, %esp
	
	movl	$1, -16(%ebp)
	movl	-16(%ebp), %eax
	
label_do:
	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp
	
	pushl	$msg_main_print2
	call	printf
	addl	$4,%esp
	
	leal	-16(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scan1
	call	scanf
	addl	$8,%esp
	
	movl	-16(%ebp),%eax
	cmpl	$0, %eax
	jle		label_switch
	cmpl	$5,%eax
	jge		label_switch
	pushl	$msg_main_print3
	call	printf
	addl	$4,%esp
	leal	-4(%ebp),%eax
	leal	-8(%ebp),%edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan2
	call	scanf
	addl	$12,%esp
	
label_switch:
	movl	-16(%ebp),%eax
	cmpl	$1,%eax
	je		label_switch1
	cmpl	$2,%eax
	je		label_switch2
	cmpl	$3,%eax
	je		label_switch3
	cmpl	$4,%eax
	je		label_switch4
	cmpl	$5,%eax
	je		label_out
	jmp		label_default
	
  label_switch1:
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	Addition
	addl	$8,%esp
	movl	%eax,-12(%ebp)
	jmp		label_ans
	
  label_switch2:
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	Subtraction
	addl	$8,%esp
	movl	%eax,-12(%ebp)
	jmp		label_ans
	
  label_switch3:
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	Multiplication
	addl	$8,%esp
	movl	%eax,-12(%ebp)
	jmp		label_ans
	
  label_switch4:
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	Division
	addl	$8,%esp
	movl	%eax,-12(%ebp)
	jmp		label_ans
	
  label_default:
	pushl	$msg_main_print4
	call	printf
	addl	$4,%esp
	movl	$1,-16(%ebp)
	jmp		label_do

label_ans:
	pushl	-12(%ebp)
	pushl	$msg_main_print5
	call	printf
	addl	$8,%esp
	
	pushl	$msg_main_print6
	call	printf
	addl	$4,%esp
	
	leal	-16(%ebp),%ebx
	pushl	%ebx
	pushl	$msg_main_scan1
	call	scanf
	addl	$8,%esp
	
	movl	-16(%ebp),%eax
	cmpl	$1,%eax
	je		label_do
	
label_out:
	pushl	$0
	call	exit
	
	
.globl Addition
.type Addition,@function
Addition:
	pushl	%ebp
	movl	%esp,%ebp
	
	movl	8(%ebp),%eax
	movl	12(%ebp),%edx
	addl	%edx, %eax
	
	movl	%ebp, %esp
	pop		%ebp
	
	ret
	
	
.globl Subtraction
.type  Subtraction, @function
Subtraction:
	pushl	%ebp
	movl	%esp,%ebp
	
	movl	8(%ebp),%eax
	movl	12(%ebp),%edx
	subl	%edx, %eax
	
	movl	%ebp, %esp
	pop		%ebp
	
	ret
	
.globl Multiplication
.type  Multiplication, @function
Multiplication:
	pushl	%ebp
	movl	%esp,%ebp
	
	movl 	8(%ebp),%eax
	movl 	12(%ebp),%ecx
	mull	%ecx
	
	movl 	%ebp, %esp
	pop 	%ebp
	
	ret
	
.globl	Division
.type 	Division, @function
Division:
	pushl	%ebp
	movl	%esp,%ebp
	
	movl 	8(%ebp),%eax
	movl 	12(%ebp),%ecx
	xorl	%edx,%edx
	divl	%ecx
	
	movl 	%ebp, %esp
	pop 	%ebp
	
	ret
	
	

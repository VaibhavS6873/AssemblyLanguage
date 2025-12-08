.section .rodata
 	msg_fun_print:
 	.string "In fun:%d\n"
 	
 	
 .section .data
 	.type g_iNo, @object
 	.size g_iNo,4
 	.align 4
 g_iNo:
 	.int 10
 	
 .section .data
 .globl fun
 .type fun, @function
 fun:
 	pushl %ebp
 	movl %esp,%ebp
 	
 	pushl g_iNo
 	pushl $msg_fun_print
 	call printf
 	addl $8,%esp
 	
 	movl %ebp,%esp
 	popl %ebp
 	ret

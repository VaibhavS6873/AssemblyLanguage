.section .rodata
 	msg_fun_print:
 	.string "In fun:%d\n"
 	
 	
 .section .bss
 	.comm g_iNo, 4, 4
 	
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

.section .rodata
	msg_main_print:
	.string "In main:%d\n"

.section .text
.globl main
.type main, @function
main:
	pushl %ebp
	mov %esp, %ebp
	
	pushl g_iNo
	pushl $msg_main_print 
	call printf
	addl $8, %esp
	
	call fun
	
	pushl $0
	call exit
	
	
	

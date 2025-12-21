	.section .rodata
		msg_main_print1:
		.string	"Enter value of planes, rows & columns:\t"
		
		msg_main_print2:
		.string	"Enter [%d][%d][%d] value:\t"
		
		msg_main_print3:
		.string	"Entered elements are:\n"
		
		msg_main_print4:
		.string	"[%d][%d][%d] value is:\t%d\n"
		
		msg_main_scan1:
		.string	"%d%d%d"
		
		msg_main_scan2:
		.string	"%d"
		
		msg_main_puts:
		.string	"Memory allocation FAILED"	
		
	.section .text
	.globl	main
	.type main, @function
	main:
			andl	$-16, %esp
			pushl	%ebp
			movl	%esp,%ebp
			
			subl	$48, %esp
			
			movl	$msg_main_print1, (%esp)
			call	printf
			
			leal	-4(%ebp),%eax
			leal	-8(%ebp),%edx
			leal	-12(%ebp),%ebx
			movl	$msg_main_scan1,(%esp)
			movl	%eax,4(%esp)
			movl	%edx,8(%esp)
			movl	%ebx,12(%esp)
			call	scanf
			
			movl	-4(%ebp),%eax
			movl	$4,%ecx
			mul		%ecx
			movl	%eax, (%esp)
			call	malloc
			movl	%eax, -28(%ebp)
			
			cmpl	$0,-28(%ebp)
			je		label_memory_failed
			
			
			movl	$0,-16(%ebp)
			jmp		label_for1_condition

	label_for1:
			movl	-8(%ebp),%eax
			movl	$4,%ecx
			mull	%ecx
			movl	%eax,(%esp)
			call	malloc
			movl	-16(%ebp),%edx
			movl	-28(%ebp),%ebx
			movl	%eax,(%ebx,%edx,4)
			cmpl	$0,%eax
			je		label_memory_failed
			
			movl	$0,-20(%ebp)
			jmp		label_for2_condition
			
		label_for2:
			movl	-12(%ebp),%eax
			movl	$4,%ecx
			mull	%ecx
			movl	%eax,(%esp)
			call	malloc
			movl	-16(%ebp),%edx
			movl	-28(%ebp),%ebx
			movl	-20(%ebp),%ecx
			movl	(%ebx,%edx,4),%ebx
			movl	%eax,(%ebx,%ecx,4)
			cmpl	$0,%eax
			je		label_memory_failed
			
			movl	$0,-24(%ebp)
			jmp		label_for3_condition
			
			label_for3:
				movl	-16(%ebp),%ebx
				movl	-20(%ebp),%edx
				movl	$msg_main_print2,(%esp)
				movl	%ebx,4(%esp)
				movl	%edx,8(%esp)
				movl	%ecx,12(%esp)
				call	printf
				
				movl	-16(%ebp),%eax
				movl	-20(%ebp),%edx
				movl	-24(%ebp),%ecx
				movl	-28(%ebp),%ebx
				movl	(%ebx,%eax,4),%ebx
				movl	(%ebx,%edx,4),%ebx
				leal	(%ebx,%ecx,4),%ebx
				movl	$msg_main_scan2,(%esp)
				movl	%ebx,4(%esp)
				call	scanf
				
				addl	$1,-24(%ebp)
			
			label_for3_condition:
				movl	-24(%ebp),%ecx
				movl	-12(%ebp),%ebx
				cmpl	%ebx,%ecx
				jl		label_for3
			
			addl	$1,-20(%ebp)
			
		label_for2_condition:
			movl	-20(%ebp),%eax
			movl	-8(%ebp),%ebx
			cmpl	%ebx,%eax
			jl		label_for2

			addl	$1,-16(%ebp)
	label_for1_condition:
			movl	-16(%ebp),%eax
			movl	-4(%ebp),%ebx
			cmpl	%ebx,%eax
			jl		label_for1
			
			
			movl	$msg_main_print3,(%esp)
			call	printf
			
			#------------------new------------------------
			
			movl	$0,-16(%ebp)
			jmp		label_for1_condition_second

	label_for1_second:
			movl	$0,-20(%ebp)
			jmp		label_for2_condition_second
			
		label_for2_second:
			movl	$0,-24(%ebp)
			jmp		label_for3_condition_second
			
			label_for3_second:
				movl	-16(%ebp),%eax
				movl	-20(%ebp),%edx
				movl	-24(%ebp),%ecx
				movl	-28(%ebp),%ebx
				movl	(%ebx,%eax,4),%ebx
				movl	(%ebx,%edx,4),%ebx
				movl	(%ebx,%ecx,4),%ebx
				movl	$msg_main_print4,(%esp)
				movl	%eax,4(%esp)
				movl	%edx,8(%esp)
				movl	%ecx,12(%esp)
				movl	%ebx,16(%esp)
				call	printf
				
				addl	$1,-24(%ebp)
			
			label_for3_condition_second:
				movl	-24(%ebp),%eax
				movl	-12(%ebp),%ebx
				cmpl	%ebx,%eax
				jl		label_for3_second
			
			addl	$1,-20(%ebp)
			
		label_for2_condition_second:
			movl	-20(%ebp),%eax
			movl	-8(%ebp),%ebx
			cmpl	%ebx,%eax
			jl		label_for2_second

			addl	$1,-16(%ebp)
label_for1_condition_second:
			movl	-16(%ebp),%eax
			movl	-4(%ebp),%ebx
			cmpl	%ebx,%eax
			jl		label_for1_second
			

				# i = 0
			movl $0, -16(%ebp)
			jmp free_outer_cond

free_outer:
			movl $0, -20(%ebp)             # j = 0
			jmp free_inner_cond

free_inner:
			movl -28(%ebp), %ebx
			movl -16(%ebp), %eax
			movl -20(%ebp), %edx
			movl (%ebx,%eax,4), %ebx      # arr[i]
			movl (%ebx,%edx,4), %ebx      # arr[i][j]
			movl %ebx, (%esp)
			call free
			
			movl -28(%ebp), %ebx
			movl -16(%ebp), %eax
			movl -20(%ebp), %edx
			movl (%ebx,%eax,4), %ebx      # arr[i]
			movl $0, (%ebx,%edx,4)

			addl $1, -20(%ebp)

free_inner_cond:
			movl -20(%ebp), %eax
			movl -8(%ebp), %ebx
			cmpl %ebx, %eax
			jl free_inner

			movl -28(%ebp), %ebx
			movl -16(%ebp), %eax
			movl (%ebx,%eax,4), %ebx
			movl %ebx, (%esp)
			call free

			movl -28(%ebp), %ebx
			movl -16(%ebp), %eax
			movl $0, (%ebx,%eax,4)

			addl $1, -16(%ebp)

free_outer_cond:
			movl -16(%ebp), %eax
			movl -4(%ebp), %ebx
			cmpl %ebx, %eax
			jl free_outer

			movl -28(%ebp), %ebx
			movl %ebx, (%esp)
			call free
			movl $0, -28(%ebp)

			
			movl	$0,(%esp)
			call	exit
	label_memory_failed:
			movl	$msg_main_puts,(%esp)
			call	puts
			movl	$-1,(%esp)
			call	exit
		
		

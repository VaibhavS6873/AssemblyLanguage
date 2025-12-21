.section .rodata
	msg_main_print1:
	.string	"\n1.Insert\n2.Delete\n3.Search\n4.Count\n5.Reverse Display\n6.Exit\n"
	
	msg_main_print2:
	.string	"Enter your choice:\t"
	
	msg_main_print3:
	.string	"\n1.InsertFirst\n2.InsertLast\n3.InsertAtPosition\n4.Back\n"
	
	msg_main_print4:
	.string	"Enter your choice again:\t"
	
	msg_main_print5:
	.string	"Enter valid choice\n"
	
	msg_main_print6:
	.string	"Enter data to be insert:\t"
	
	msg_main_print7:
	.string	"Enter position:\t"
	
	msg_main_print8:
	.string	"Linked List Empty, Deletion impossible.\n"
	
	msg_main_print9:
	.string	"\n1.DeleteFirst\n2.DeleteLast\n3.DeleteAtPosition\n4.Back\n"
	
	msg_main_print10:
	.string	"Linked List Empty\n"
	
	msg_main_print11:
	.string	"Deleted data is %d\n"
	
	msg_main_print12:
	.string	"Linked List Empty, Searching impossible.\n"
	
	msg_main_print13:
	.string	"\n1.SearchFirstOccurance\n2.SearchLastOccurance\n3.SearchAllOccurances\n4.Back\n"
	
	msg_main_print14:
	.string	"Enter data to be search:\t"
	
	msg_main_print15:
	.string	"Data not found\n"
	
	msg_main_print16:
	.string	"Data found at %d position\n"
	
	msg_main_print17:
	.string	"Data found %d times\n"
	
	msg_main_print18:
	.string	"Total node present : %d\n"
	
	msg_main_print19:
	.string	"Bye...\n"
	
	msg_pos_invalid:
	.string	"Position is invalid\n"
	
	msg_memory_failed:
	.string	"memory allocation FAILED\n"
	
	msg_Display_print1:
	.string	"\nLinked list is:\n"
	
	msg_Display_print2:
	.string	"EMPTY\n"
	
	msg_ReverseDisplay_print1:
	.string	"\nReverse Linked list is:\n"
	
	msg_common_print1:
	.string	"<-|%d|->"
	
	msg_common_print2:
	.string	"\n"
	
	msg_DeleteAll_print1:
	.string	"\nDeleted All Nodes Successfully\n"
	
	msg_main_scan1:
	.string	"%d"
	
	
.section .text
.globl	main
.type main, @function
main:
		andl	$-16,%esp
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$48,%esp
		
		movl	$0,-16(%ebp)
		movl	$0,-20(%ebp)
		
label_while:
		movl	$msg_main_print1,(%esp)
		call	printf
		
		movl	$msg_main_print2,(%esp)
		call	printf
		
		leal	-12(%ebp),%ebx
		movl	$msg_main_scan1,(%esp)
		movl	%ebx,4(%esp)
		call	scanf
		
		movl	-12(%ebp),%eax
		cmpl	$1,%eax
		je		label_switch1
		cmpl	$2,%eax
		je		label_switch2
		cmpl	$3,%eax
		je		label_switch3
		cmpl	$4,%eax
		je		label_switch4
		cmpl	$5,%eax
		je		label_switch5
		cmpl	$6,%eax
		je		label_switch6
		jmp		label_default
		
label_switch1:
		label_while1:
			movl	$msg_main_print3,(%esp)
			call	printf
			
			movl	$msg_main_print4,(%esp)
			call	printf
			
			leal	-12(%ebp),%ebx
			movl	$msg_main_scan1,(%esp)
			movl	%ebx,4(%esp)
			call	scanf
			
			movl	-12(%ebp),%ebx
			cmpl	$4,%ebx
			je		label_while
			
			cmpl	$0,%ebx
			jg		label_next
			movl	$msg_main_print5,(%esp)
			call	printf
			jmp		label_while1
			
		label_next:
			cmpl	$3,%ebx
			jle		label_next_print
			movl	$msg_main_print5,(%esp)
			call	printf
			jmp		label_while1
			
		label_next_print:
			movl	$msg_main_print6,(%esp)
			call	printf
			leal	-4(%ebp),%ebx
			movl	$msg_main_scan1,(%esp)
			movl	%ebx,4(%esp)
			call	scanf
			
			movl	-12(%ebp),%ebx
			cmpl	$1,%ebx
			je		label_case1_switch1
			cmpl	$2,%ebx
			je		label_case1_switch2
			cmpl	$3,%ebx
			je		label_case1_switch3
			
				label_case1_switch1:
						leal	-16(%ebp),%eax
						leal	-20(%ebp),%edx
						movl	-4(%ebp),%ebx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						movl	%ebx,8(%esp)
						call	InsertFirst
						jmp		label_Display
						
				label_case1_switch2:
						leal	-16(%ebp),%eax
						leal	-20(%ebp),%edx
						movl	-4(%ebp),%ebx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						movl	%ebx,8(%esp)
						call	InsertLast
						jmp		label_Display

						
				label_case1_switch3:
						movl	$msg_main_print7,(%esp)
						call	printf
						
						leal	-8(%ebp),%ebx
						movl	$msg_main_scan1,(%esp)
						movl	%ebx,4(%esp)
						call	scanf
						
						leal	-16(%ebp),%eax
						leal	-20(%ebp),%edx
						movl	-4(%ebp),%ebx
						movl	-8(%ebp),%ecx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						movl	%ebx,8(%esp)
						movl	%ecx,12(%esp)
						call	InsertAtPosition
						
						
		label_Display:				
			movl	-16(%ebp),%eax
			movl	-20(%ebp),%edx
			movl	%eax,(%esp)
			movl	%edx,4(%esp)
			call	Display
			jmp		label_while1	
						
					
label_switch2:
		movl	-16(%ebp),%eax
		cmpl	$0,%eax
		jne		label_while2
		movl	$msg_main_print8,(%esp)
		call	printf
		jmp		label_while
		
		label_while2:
			movl	$msg_main_print9,(%esp)
			call	printf
			
			movl	$msg_main_print4,(%esp)
			call	printf
			
			leal	-12(%ebp),%ebx
			movl	$msg_main_scan1,(%esp)
			movl	%ebx,4(%esp)
			call	scanf
			
			movl	-12(%ebp),%ebx
			cmpl	$4,%ebx
			je		label_while
			
			movl	-12(%ebp),%ebx
			cmpl	$1,%ebx
			je		label_case2_switch1
			cmpl	$2,%ebx
			je		label_case2_switch2
			cmpl	$3,%ebx
			je		label_case2_switch3
			jmp		label_case2_default
					
				label_case2_switch1:
						leal	-16(%ebp),%eax
						leal	-20(%ebp),%edx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						call	DeleteFirst
						movl	%eax,-4(%ebp)
						jmp		label_out_case2_switch
						
				label_case2_switch2:
						leal	-16(%ebp),%eax
						leal	-20(%ebp),%edx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						call	DeleteLast
						movl	%eax,-4(%ebp)
						jmp		label_out_case2_switch
						
				label_case2_switch3:
						movl	$msg_main_print7,(%esp)
						call	printf
						
						leal	-8(%ebp),%ebx
						movl	$msg_main_scan1,(%esp)
						movl	%ebx,4(%esp)
						call	scanf
						
						leal	-16(%ebp),%eax
						leal	-20(%ebp),%edx
						movl	-8(%ebp),%ebx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						movl	%ebx,8(%esp)
						call	DeleteAtPosition
						movl	%eax,-4(%ebp)
						jmp	label_out_case2_switch
				
				label_case2_default:
						movl	$msg_main_print5,(%esp)
						call	printf
						movl	$4,-12(%ebp)
						
		label_out_case2_switch:
				movl	-4(%ebp),%eax
				cmpl	$-1,%eax
				jne		label_else_if
				movl	$msg_main_print10,(%esp)
				call	printf
				jmp		label_while
				
				label_else_if:
					movl	-12(%ebp),%eax
					cmpl	$4,%eax	
					je		label_while2
					movl	-4(%ebp),%eax
					cmpl	$-2,%eax
					je		label_while2
					movl	$msg_main_print11,(%esp)
					movl	%eax,4(%esp)
					call	printf
					movl	-16(%ebp),%eax
					movl	-20(%ebp),%edx
					movl	%eax,(%esp)
					movl	%edx,4(%esp)
					call	Display
					jmp		label_while2
					
					
label_switch3:
		movl	-16(%ebp),%eax
		cmpl	$0,%eax
		jne		label_while3
		movl	$msg_main_print12,(%esp)
		call	printf
		jmp		label_while
		
		label_while3:
			movl	$msg_main_print13,(%esp)
			call	printf
			
			movl	$msg_main_print4,(%esp)
			call	printf
			
			leal	-12(%ebp),%ebx
			movl	$msg_main_scan1,(%esp)
			movl	%ebx,4(%esp)
			call	scanf
			
			movl	-12(%ebp),%ebx
			cmpl	$4,%ebx
			je		label_while
			
			cmpl	$0,%ebx
			jg		label_next1
			movl	$msg_main_print5,(%esp)
			call	printf
			jmp		label_while3
			
		label_next1:
			cmpl	$3,%ebx
			jle		label_next_display
			movl	$msg_main_print5,(%esp)
			call	printf
			jmp		label_while3
			
		label_next_display:
			movl	-16(%ebp),%eax
			movl	-20(%ebp),%edx
			movl	%eax,(%esp)
			movl	%edx,4(%esp)
			call	Display
			
			movl	$msg_main_print14,(%esp)
			call	printf
			leal	-4(%ebp),%ebx
			movl	$msg_main_scan1,(%esp)
			movl	%ebx,4(%esp)
			call	scanf
		
			movl	-12(%ebp),%ebx
			cmpl	$1,%ebx
			je		label_case3_switch1
			cmpl	$2,%ebx
			je		label_case3_switch2
			cmpl	$3,%ebx
			je		label_case3_switch3
			
				label_case3_switch1:
						movl	-16(%ebp),%eax
						movl	-20(%ebp),%edx
						movl	-4(%ebp),%ecx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						movl	%ecx,8(%esp)
						call	SearchFirstOccurance
						movl	%eax,-4(%ebp)
						
						cmpl	$-1,%eax
						jne		label_elseif1
						movl	$msg_main_print10,(%esp)
						call	printf
						jmp		label_while3
						
					label_elseif1:
						movl	-4(%ebp),%eax
						cmpl	$-2,%eax
						jne		label_else
						movl	$msg_main_print15,(%esp)
						call	printf
						jmp		label_while3
						
					label_else:
						movl	-4(%ebp),%eax
						movl	$msg_main_print16,(%esp)
						movl	%eax,4(%esp)
						call	printf
						jmp		label_while3
						
				label_case3_switch2:
						movl	-16(%ebp),%eax
						movl	-20(%ebp),%edx
						movl	-4(%ebp),%ecx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						movl	%ecx,8(%esp)
						call	SearchLastOccurance
						movl	%eax,-4(%ebp)
						
						cmpl	$-1,%eax
						jne		label_elseif2
						movl	$msg_main_print10,(%esp)
						call	printf
						jmp		label_while3
						
					label_elseif2:
						movl	-4(%ebp),%eax
						cmpl	$-2,%eax
						jne		label_else1
						movl	$msg_main_print15,(%esp)
						call	printf
						jmp		label_while3
						
					label_else1:
						movl	-4(%ebp),%eax
						movl	$msg_main_print16,(%esp)
						movl	%eax,4(%esp)
						call	printf
						jmp		label_while3
						
						
				label_case3_switch3:
						movl	-16(%ebp),%eax
						movl	-20(%ebp),%edx
						movl	-4(%ebp),%ecx
						movl	%eax,(%esp)
						movl	%edx,4(%esp)
						movl	%ecx,8(%esp)
						call	SearchAllOccurances
						movl	%eax,-4(%ebp)
						
						movl	$msg_main_print17,(%esp)
						movl	%eax,4(%esp)
						call	printf
						jmp		label_while3
						
label_switch4:
		movl	-16(%ebp),%eax
		movl	-20(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	Display
			
		movl	-16(%ebp),%eax
		movl	-20(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	CountNode
		movl	%eax,-4(%ebp)
		movl	$msg_main_print18,(%esp)
		movl	%eax,4(%esp)
		call	printf
		jmp		label_while
			
label_switch5:
		movl	-16(%ebp),%eax
		movl	-20(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	Display
		movl	-16(%ebp),%eax
		movl	-20(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	ReverseDisplay
		jmp		label_while
		
label_switch6:
		movl	-16(%ebp),%eax
		movl	-20(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	Display
		
		movl	-16(%ebp),%eax
		cmpl	$0,%eax
		je		label_exit
		leal	-16(%ebp),%eax
		leal	-20(%ebp),%edx
		movl	%eax,(%esp)
		movl	%edx,4(%esp)
		call	DeleteAllNodes
		
		label_exit:
				movl	$msg_main_print19,(%esp)
				call	printf
				movl	$0,(%esp)
				call	exit
label_default:
		movl	$msg_main_print5,(%esp)
		call	printf
		jmp		label_while
		
		
.section .rodata
	msg_insideif:
	.string	"\ninsideif\n"
	
	msg_outsideif:
	.string	"\noutsideif\n"
.globl	InsertFirst
.type	InsertFirst,@function
InsertFirst:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$0, -4(%ebp)
		
		movl	$12,(%esp)
		call	malloc
		movl	%eax,-4(%ebp)
		
		cmpl	$0,%eax
		je		label_memory_failed
		
		movl	-4(%ebp),%eax
		movl	16(%ebp),%edx
		movl	%edx,4(%eax) 		#pNewNode->iData = iNo
		
		movl	8(%ebp),%eax		#ppHead
		cmpl	$0,(%eax)
		jne		label_new
		
		#First node case - create self-referencing circular node
		movl	-4(%ebp),%ebx		#pNewNode
		movl	8(%ebp),%eax		#ppHead
		movl	12(%ebp),%edx		#ppTail
		movl	%ebx,(%eax)			#*ppHead = pNewNode
		movl	%ebx,(%edx)			#*ppTail = pNewNode
		movl	%ebx,8(%ebx)		#pNewNode->pNext = pNewNode
		movl	%ebx,0(%ebx)			#pNewNode->pPrev = pNewNode
		movl	%ebp,%esp
		pop		%ebp
		ret	
		
	label_new:
		#Insert at beginning of existing list
		movl	-4(%ebp),%eax		#pNewNode
		movl	8(%ebp),%edx		#ppHead
		movl	(%edx),%ebx			#*ppHead(old head)
		
		#Link new node
		movl	%ebx,8(%eax)		#pNewNode->pNext = old head
		movl	%eax,0(%ebx)		#old head->pPrev = pNewNode
		
		#Update head pointer
		movl	%eax,(%edx)			#*ppHead = pNewNode
		
		#Restore circular links
		movl	12(%ebp),%ecx		#ppTail
		movl	(%ecx),%edx			#*ppTail
		movl	%eax,0(%edx)		#(*ppTail)->pPrev = new head
		movl	%edx,0(%eax)		#new head->pPrev = *ppTail
		movl	%eax,8(%edx)		#(*ppTail)->pNext = new head
		
		movl	%ebp,%esp
		pop		%ebp
		ret
		
			
.globl	InsertLast
.type	InsertLast,@function
InsertLast:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$0, -4(%ebp)
		
		movl	$12,(%esp)
		call	malloc
		movl	%eax,-4(%ebp)
		
		cmpl	$0,%eax
		je		label_memory_failed
		
		movl	-4(%ebp),%eax
		movl	16(%ebp),%edx
		movl	%edx,4(%eax) 		#pNewNode->iData = iNo
		
		movl	8(%ebp),%eax		#ppHead
		cmpl	$0,(%eax)
		jne		label_new1
		
		#First node case
		movl	12(%ebp),%edx		#ppTail
		movl	-4(%ebp),%ebx		#pNewNode
		movl	%ebx,(%eax) 		#*ppHead = pNewNode
		movl	%ebx,(%edx) 		#*ppTail = pNewNode
		movl	%ebx,8(%ebx)		#pNewNode->pNext = pNewNode
		movl	%ebx,0(%ebx)		#pNewNode->pPrev = pNewNode
		movl 	%ebp, %esp
		pop 	%ebp
		ret
		
	label_new1:
		#Insert at end
		movl	12(%ebp),%edx		#ppTail
		movl	(%edx),%ebx			#*ppTail(old tail)
		movl	-4(%ebp),%eax		#pNewNode
		
		#Link new node
		movl	%ebx,0(%eax)		#pNewNode->pPrev = old tail
		movl	%eax,8(%ebx)		#old tail->pNext = pNewNode
		
		#Update	tail pointer
		movl	%eax,(%edx)			#*ppTail = pNewNode
		
		#Restore circular links
		movl	8(%ebp),%ecx		#ppHead
		movl	(%ecx),%ebx			#*ppHead
		movl	%ebx,8(%eax)		#pNewNode->pNext = *ppHead (new tail->pNext = head)
		movl	%eax,0(%ebx)		#(*ppHead)->pPrev = pNewNode(head->pPrev = new tail) 
	
		movl %ebp, %esp
		pop %ebp
		ret


.globl	InsertAtPosition
.type	InsertAtPosition,@function
InsertAtPosition:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$32,%esp
		
		movl	$0,-4(%ebp)
		movl	$0,-8(%ebp)
		
		movl	8(%ebp),%eax
		movl	12(%ebp),%edx
		movl	(%eax),%ebx
		movl	(%edx),%ecx
		movl	%ebx,(%esp)
		movl	%ecx,4(%esp)
		call	CountNode
		movl	%eax,-12(%ebp)
		
		
		movl	20(%ebp),%eax
		cmpl	$0,%eax
		jg		label_InsertAtNew
		movl	$msg_pos_invalid,(%esp)
		call	printf
		movl %ebp, %esp
		pop %ebp
		ret
		
	label_InsertAtNew:
		movl	-12(%ebp),%edx
		addl	$1,%edx
		cmpl	%edx,%eax
		jle		label_InsertAtFirst
		movl	$msg_pos_invalid,(%esp)
		call	printf
		movl %ebp, %esp
		pop %ebp
		ret
		
	label_InsertAtFirst:
		cmpl	$1,%eax
		jne		label_InsertAtLast
		movl	8(%ebp),%edx
		movl	12(%ebp),%ebx
		movl	16(%ebp),%ecx
		movl	%edx,(%esp)
		movl	%ebx,4(%esp)
		movl	%ecx,8(%esp)
		call	InsertFirst
		movl %ebp, %esp
		pop %ebp
		ret
		
	label_InsertAtLast:
		movl	-12(%ebp),%edx
		addl	$1,%edx
		cmpl	%eax,%edx
		jne		label_InsertAtMiddle
		movl	8(%ebp),%edx
		movl	12(%ebp),%ebx
		movl	16(%ebp),%ecx
		movl	%edx,(%esp)
		movl	%ebx,4(%esp)
		movl	%ecx,8(%esp)
		call	InsertLast
		movl 	%ebp, %esp
		pop	   %ebp
		ret
		
	label_InsertAtMiddle:
		movl	8(%ebp),%eax
		movl	(%eax),%edx
		movl	%edx,-8(%ebp)
		movl	$1,-12(%ebp)
		jmp		label_InsertAtWhile_Condition
		
		label_InsertAtWhile:
			addl	$1,-12(%ebp)
			movl	-8(%ebp),%eax
			movl	8(%eax),%ebx
			movl	%ebx,-8(%ebp)
			
		label_InsertAtWhile_Condition:
			movl	-12(%ebp),%eax
			movl	20(%ebp),%edx
			subl	$1,%edx
			cmpl	%edx,%eax
			jl		label_InsertAtWhile
			
			movl	$12,(%esp)
			call	malloc
			movl	%eax,-4(%ebp)
			
			cmpl	$0,-4(%ebp)
			je		label_memory_failed
			movl	-4(%ebp),%eax
			movl	-8(%ebp),%edx
			movl	16(%ebp),%ebx
			movl	%ebx,4(%eax)  		#pNewNode->iData = iNo
			movl	8(%edx),%ebx 		#pTemp->pNext
			movl	%ebx,8(%eax) 		#pNewNode->pNext = pTemp->pNext
			movl	%eax, (%ebx) 		#pTemp->pNext->pPrev = pNewNode
			movl	%eax, 8(%edx)	 		#pTemp->pNext = pNewNode
			movl	%edx,(%eax)	 		#pNewNode->pPrev = pTemp
			movl %ebp, %esp
			pop %ebp
			ret
			
			
.globl	DeleteFirst
.type 	DeleteFirst,@function
DeleteFirst:
		pushl	%ebp
		movl	%esp,%ebp
	
		subl	$16,%esp
	
		movl	8(%ebp),%eax 			#ppHead
		cmpl	$0,(%eax)
		jne		label_DeleteFirstNew
		movl	$-1,%eax
		movl 	%ebp, %esp
		pop 	%ebp
		ret
		
	label_DeleteFirstNew:
		movl	(%eax),%ebx				#*ppHead
		movl	4(%ebx),%edx			
		movl	%edx,-4(%ebp)			#iDelData = (*ppHead)->iData
		
		movl	12(%ebp),%edx			#ppTail
		movl	(%edx),%ecx				#*ppTail
		cmpl	%ecx,%ebx				#if(*ppHead == *ppTail) - Single node
		jne		label_DeleteFirstNew1

		movl	$0,8(%ebx)				#(*ppHead)->pNext = NULL
		movl	$0,(%ebx)				#(*ppHead)->pPrev = NULL
		movl	%ebx,(%esp)
		call	free
		movl	8(%ebp),%eax			#ppHead
		movl	$0,(%eax)				#*ppHead = NULL
		movl	12(%ebp),%edx			#ppTail
		movl	$0,(%edx)				#*ppTail = NULL
		movl	-4(%ebp),%eax			#return deleted data
		movl 	%ebp, %esp
		pop 	%ebp
		ret
		
	label_DeleteFirstNew1:
		movl	(%edx),%ecx			#*pptail
		movl	8(%ebx),%edx		#(*ppHead)->pNext
		movl	%edx,(%eax)			#*ppHead = (*ppHead)->pNext
		movl	(%eax),%ebx			#*ppHead
		movl	8(%ecx),%eax		#(*ppTail)->pNext
		movl	$0,8(%eax)			#(*ppTail)->pNext->pNext = NULL
		movl	$0,(%eax)			#(*ppTail)->pNext->pPrev = NULL
		
		movl	%ebx,8(%ecx)		#(*ppTail)->pNext = *ppHead
		movl	%ecx,(%ebx)			#(*ppHead)->pPrev = *ppTail
		movl	%eax,(%esp)			
		call	free
		
		movl	-4(%ebp),%eax
		movl 	%ebp, %esp
		pop 	%ebp
		ret
		
	
			
.globl	DeleteLast
.type	DeleteLast,@function
DeleteLast:
		pushl	%ebp
		movl	%esp,%ebp
	
		subl	$16,%esp
	
		movl	8(%ebp),%eax 			#ppHead
		cmpl	$0,(%eax)
		jne		label_DeleteLastNew
		movl	$-1,%eax
		movl 	%ebp, %esp
		pop 	%ebp
		ret
		
	label_DeleteLastNew:
		movl	12(%ebp),%edx			#ppTail
		movl	(%edx),%ebx				#*ppTail
		movl	4(%ebx),%ecx			
		movl	%ecx,-4(%ebp)			#iDelData = (*ppTail)->iData
		
		#check if single node
		movl	8(%ebp),%eax			#ppHead
		movl	(%eax),%eax				#*ppHead
		cmpl	%ebx,%eax				#if(*ppHead == *ppTail) - Single node
		jne		label_DeleteLastMultiple

		# Single node case - ebx still holds *ppTail which is equal to *ppHead
		movl	$0,8(%ebx)				#(*ppHead)->pNext = NULL
		movl	$0,(%ebx)				#(*ppHead)->pPrev = NULL
		movl	%ebx,(%esp)
		call	free
		movl	8(%ebp),%eax			#ppHead
		movl	$0,(%eax)				#*ppHead = NULL
		movl	12(%ebp),%edx			#ppTail
		movl	$0,(%edx)				#*ppTail = NULL
		movl	-4(%ebp),%eax			#return deleted data
		movl 	%ebp, %esp
		pop 	%ebp
		ret
		
	label_DeleteLastMultiple:
		# Multiple nodes case
		movl	12(%ebp), %edx			# ppTail
		movl	(%edx), %ebx			# ebx = oldTail = *ppTail
		movl	(%ebx), %ecx			# ecx = newTail = oldTail->pPrev

		# Update tail pointer to new tail
		movl	%ecx, (%edx)			# *ppTail = newTail

		# Get head pointer for circular linking
		movl	8(%ebp), %eax			# ppHead
		movl	(%eax), %eax			# eax = *ppHead

		# Restore circular links: newTail <-> head
		movl	%eax, 8(%ecx)			# newTail->pNext = head
		movl	%ecx, (%eax)			# head->pPrev = newTail

		# Clear old tail's links before freeing
		movl	$0, 8(%ebx)				# oldTail->pNext = NULL
		movl	$0, (%ebx)				# oldTail->pPrev = NULL

		# Free the old tail node
		movl	%ebx, (%esp)
		call	free

		# Return the deleted value
		movl	-4(%ebp), %eax
		movl	%ebp, %esp
		pop		%ebp
		ret
			

.globl	DeleteAtPosition
.type	DeleteAtPosition,@function
DeleteAtPosition:
		pushl	%ebp
		movl	%esp,%ebp
		subl	$16,%esp

		movl	$0,-4(%ebp)

		movl	8(%ebp),%eax        # ppHead
		movl	12(%ebp),%edx       # ppTail
		movl	(%eax),%ebx         # *ppHead
		movl	(%edx),%ecx         # *ppTail
		movl	%ebx,(%esp)
		movl	%ecx,4(%esp)
		call	CountNode
		movl	%eax,-8(%ebp)       # iCount

		movl	16(%ebp),%eax       # iPos
		cmpl	$0,%eax
		jg		label_ValidatePosition
		movl	$msg_pos_invalid,(%esp)
		call	printf
		movl	$-2,%eax
		movl	%ebp,%esp
		pop		%ebp
		ret

label_ValidatePosition:
		movl	-8(%ebp),%edx       # iCount
		cmpl	%edx,%eax          # if iPos > iCount
		jle		label_CheckPositionType
		movl	$msg_pos_invalid,(%esp)
		call	printf
		movl	$-2,%eax
		movl	%ebp,%esp
		pop		%ebp
		ret

label_CheckPositionType:
		cmpl	$1,%eax
		je		label_DeleteAtFirst

		movl	-8(%ebp),%edx       # iCount
		cmpl	%edx,%eax
		je		label_DeleteAtLast

		jmp		label_DeleteAtMiddle

label_DeleteAtFirst:
		movl	8(%ebp),%edx
		movl	12(%ebp),%ebx
		movl	%edx,(%esp)
		movl	%ebx,4(%esp)
		call	DeleteFirst
		movl	%ebp,%esp
		pop		%ebp
		ret

label_DeleteAtLast:
		movl	8(%ebp),%edx
		movl	12(%ebp),%ebx
		movl	%edx,(%esp)
		movl	%ebx,4(%esp)
		call	DeleteLast
		movl	%ebp,%esp
		pop		%ebp
		ret

label_DeleteAtMiddle:
		movl	8(%ebp),%eax
		movl	(%eax),%edx         # *ppHead
		movl	%edx,-4(%ebp)       # pTemp = *ppHead
		movl	$1,-8(%ebp)         # i = 1
		jmp		label_DeleteWhileCondition

label_DeleteWhile1:
		addl	$1,-8(%ebp)
		movl	-4(%ebp),%eax
		movl	8(%eax),%ebx
		movl	%ebx,-4(%ebp)

label_DeleteWhileCondition:
		movl	-8(%ebp),%eax
		movl	16(%ebp),%edx
		cmpl	%edx,%eax
		jl		label_DeleteWhile1

		movl	-4(%ebp),%eax        # pTemp
		movl	(%eax),%edx          # pTemp->pPrev
		movl	8(%eax),%ebx         # pTemp->pNext

		movl	%ebx,8(%edx)         # pTemp->pPrev->pNext = pTemp->pNext
		movl	%edx,(%ebx)          # pTemp->pNext->pPrev = pTemp->pPrev

		movl	$0,8(%eax)           # pTemp->pNext = NULL
		movl	$0,(%eax)            # pTemp->pPrev = NULL

		movl	4(%eax),%ebx         # pTemp->iData
		movl	%ebx,-8(%ebp)
		movl	%eax,(%esp)
		call	free

		movl	-8(%ebp),%eax        # return deleted data
		movl	%ebp,%esp
		pop		%ebp
		ret
		
			
.globl	SearchFirstOccurance
.type	SearchFirstOccurance,@function
SearchFirstOccurance:
			pushl	%ebp
			movl	%esp,%ebp
			
			subl	$16,%esp
			
			cmpl	$0,8(%ebp)
			jne		label_SearchFirstNext
			movl	$-1,%eax
			movl	%ebp,%esp
			pop		%ebp
			ret
			
	label_SearchFirstNext:
			movl	$1,-4(%ebp)			#iPos = 1
			movl	8(%ebp),%ecx
			
	label_doWhile:
			movl	4(%ecx),%edx		#pHead->iData
			cmpl	16(%ebp),%edx		#if(pHead->iData == iKey)
			je 		label_found
			
			addl	$1,-4(%ebp)			#iPos++
			movl	8(%ecx),%ecx		#pHead = pHead->pNext
		
		
			#check loop termination: pHead!=ptail->pNext
			movl	12(%ebp),%edx		#pTail
			movl	8(%edx),%edx		#pTail->pNext
			cmpl	%edx, %ecx			#if(pHead != pTail->pNext)
			jne		label_doWhile
			
			#check special case for : if(pHead == pTail->pNext && iPos != 1)
			movl	-4(%ebp),%edx		#iPos
			cmpl	$1,%edx				#if iPos != 1
			jne		label_not_found		#return -2
			
	label_found:
			movl	-4(%ebp),%eax		#return iPos
			movl	%ebp,%esp
			pop		%ebp
			ret
			
	label_not_found:
			movl	$-2,%eax		#data not found
			movl	%ebp,%esp	
			pop		%ebp
			ret
				
	
			
			
			
.globl	SearchLastOccurance
.type	SearchLastOccurance,@function
SearchLastOccurance:
		pushl	%ebp
		movl	%esp,%ebp
			
		subl	$16,%esp
			
		cmpl	$0,8(%ebp)
		jne		label_SearchLastNext
		movl	$-1,%eax
		movl 	%ebp, %esp
		pop	    %ebp
		ret	
		
	label_SearchLastNext:
		movl	8(%ebp),%esi	#pHead	
		movl	12(%ebp),%edi	#ptail
		movl	$1,-4(%ebp)
		movl	$0,-8(%ebp)
			
		label_doWhile1:
			movl	4(%esi),%edx	#pHead->iData	
			cmpl	16(%ebp),%edx	#if(pHead->iData == iKey)
			jne		label_in
			movl	-4(%ebp),%ebx
			movl	%ebx,-8(%ebp)
			
		label_in:
			addl	$1,-4(%ebp)
			movl	8(%esi),%esi
			
			movl	8(%edi),%edx	#pTail->pNext
			cmpl	%edx,%esi
			jne		label_doWhile1
				
			cmpl	$0,-8(%ebp)
			jne		label_end1
			movl	$-2,%eax
			movl 	%ebp, %esp
			pop	    %ebp
			ret
				
		label_end1:
			movl	-8(%ebp),%eax
			movl 	%ebp, %esp
			pop	    %ebp
			ret		
			
			
			
			
.globl	SearchAllOccurances
.type	SearchAllOccurances,@function
SearchAllOccurances:
		pushl	%ebp
		movl	%esp,%ebp
			
		subl	$16,%esp
			
		movl	$0,-4(%ebp)
		cmpl	$0,8(%ebp)
		jne		label_doWhile2
		movl	-4(%ebp),%eax
		movl 	%ebp, %esp
		pop	    %ebp
		ret	
		
		label_doWhile2:
			movl	8(%ebp),%eax	#pHead	
			movl	4(%eax),%edx	
			cmpl	16(%ebp),%edx
			jne		label_if1
			addl	$1,-4(%ebp)
			
		label_if1:
			movl	8(%eax),%eax	#pHead = pHead->pNext
			movl    %eax,8(%ebp)
			
			movl	12(%ebp),%ebx 	#pTail
			movl	8(%ebx),%edx	#pTail->pNext
			cmpl	%edx,%eax		#pHead!=pTail->pNext
			jne		label_doWhile2
				
			movl	-4(%ebp),%eax
			movl 	%ebp, %esp
			pop	    %ebp
			ret
		
			
				
				
.globl	CountNode
.type	CountNode,@function
CountNode:
		pushl	%ebp
		movl	%esp,%ebp
			
		subl	$16,%esp
			
		movl	$0,-4(%ebp)
		cmpl	$0,8(%ebp)
		jne		label_doWhile3
		movl	-4(%ebp),%eax
		movl 	%ebp, %esp
		pop	    %ebp
		ret	
		
		label_doWhile3:
			movl	8(%ebp),%eax	#pHead	
			addl	$1,-4(%ebp)
			movl	8(%eax),%eax	#pHead = pHead->pNext
			movl    %eax,8(%ebp)
			
			movl	12(%ebp),%ebx 	#pTail
			movl	8(%ebx),%edx	#pTail->pNext
			cmpl	%edx,%eax		#pHead!=pTail->pNext
			jne		label_doWhile3
				
			movl	-4(%ebp),%eax
			movl 	%ebp, %esp
			pop	    %ebp
			ret
		
	
			
.globl	Display
.type	Display,@function
Display:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		#Print header message
		movl	$msg_Display_print1,(%esp)
		call	printf
			
		#check if pHead is NULL
		movl	8(%ebp),%eax
		cmpl	$0,%eax
		jne		label_doWhile4
		
		#Print	Empty and retrun
		movl	$msg_Display_print2,(%esp)
		call	printf
		movl 	%ebp, %esp
		pop	    %ebp
		ret
		
	label_doWhile4:
			movl	8(%ebp),%eax	#pHead	
			movl	4(%eax),%edx	#pHead->iData
			movl	$msg_common_print1,(%esp)
			movl	%edx,4(%esp)
			call	printf
			
			movl	8(%ebp),%eax	#pHead	
			movl	8(%eax),%eax	#pHead = pHead->pNext
			movl	%eax,8(%ebp)
			movl	12(%ebp),%ebx 	#pTail
			movl	8(%ebx),%edx	#pTail->pNext
			cmpl	%edx,%eax		#pHead!=pTail->pNext
			jne		label_doWhile4
			
			movl	$msg_common_print2,(%esp)
			call	printf
			
			movl 	%ebp, %esp
			pop	    %ebp
			ret
			
			
.globl	DeleteAllNodes
.type	DeleteAllNodes,@function
DeleteAllNodes:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	8(%ebp),%eax	#ppHead
		movl	(%eax),%edx		#*ppHead
			
		cmpl	$0,%edx			#check if list is empty
		jne		label_DeleteWhile_condition
		movl 	%ebp, %esp
		pop	    %ebp
		ret
		
	label_DeleteWhile:
		#(*ppHead)->pPrev = NULL
		movl	8(%ebp),%eax	#ppHead
		movl	(%eax),%edx		#*ppHead
		movl	$0,(%edx)		#(*ppHead)->pPrev = NULL
		
		#*ppHead = (*ppHead)->pNext
		movl	8(%edx),%edx	#(*ppHead)->pNext
		movl	%edx,(%eax)		#*ppHead = (*ppHead)->pNext
		
		#Get (*ppTail)->pNext (which is old head) and clear its pointers
		movl	12(%ebp),%ecx	#ppTail
		movl	(%ecx),%ecx		#*ppTail
		movl	8(%ecx),%ebx	#(*ppTail)->pNext(old head to be deleted)
		movl	$0,8(%ebx)		#(*ppTail)->pNext->pNext = NULL
		
		#free((*ppTail)->pNext) - free the old head
		movl	%ebx,(%esp)
		call	free
		
		#(*ppTail)->pNext = *ppHead(restore circular connection)
		movl	12(%ebp),%ecx	#ppTail
		movl	(%ecx),%ecx		#*pptail
		movl	8(%ebp),%eax	#ppHead
		movl	(%eax),%edx		#*ppHead
		movl	%edx,8(%ecx)	#(*ppTail)->pNext = *ppHead
		
	label_DeleteWhile_condition:
		movl	8(%ebp),%eax	#ppHead
		movl	(%eax),%edx		#*ppHead
		movl	12(%ebp),%ecx	#ppTail
		movl	(%ecx),%ebx		#*ppTail
		cmpl	%ebx,%edx		#*ppHead!=*ppTail
		jne		label_DeleteWhile
		
		#Handle the last remaining node
		movl	$0,8(%edx)		#(*ppHead)->pNext = NULL
		movl	$0,(%edx)		#(*ppHead)->pPrev = NULL
		
		movl	%edx,(%esp)		#free(*ppHead)
		call	free
		
		movl	8(%ebp),%eax	#ppHead
		movl	$0,(%eax)		#*ppHead = NULL
		movl	12(%ebp),%ecx	#ppTail
		movl	$0,(%ecx)		#*ppTail = NULL
		
		movl	$msg_DeleteAll_print1,(%esp)
		call	printf
		
		movl 	%ebp, %esp
		pop	    %ebp
		ret
		
			
.globl	ReverseDisplay
.type	ReverseDisplay,@function
ReverseDisplay:
		pushl	%ebp
		movl	%esp,%ebp
		
		subl	$16,%esp
		
		movl	$msg_ReverseDisplay_print1,(%esp)
		call	printf
			
		cmpl	$0,12(%ebp)
		jne		label_doWhile5
		movl	$msg_Display_print2,(%esp)
		call	printf
		movl 	%ebp, %esp
		pop	    %ebp
		ret
		
	label_doWhile5:
			movl	12(%ebp),%eax	#pTail	
			movl	4(%eax),%edx	#pTail->iData
			movl	$msg_common_print1,(%esp)
			movl	%edx,4(%esp)
			call	printf
			
			movl	12(%ebp),%eax	#pTail	
			movl	(%eax),%eax		#pTail = pTail->pPrev
			movl	%eax,12(%ebp)
			movl	8(%ebp),%ebx 	#pHead
			movl	(%ebx),%edx		#pHead->pPrev
			cmpl	%edx,%eax		#pTail!=pHead->pPrev
			jne		label_doWhile5
			
			movl	$msg_common_print2,(%esp)
			call	printf
			
			movl 	%ebp, %esp
			pop	    %ebp
			ret
			
						
label_memory_failed:
	movl	$msg_memory_failed,(%esp)
	call	printf
	movl %ebp, %esp
	pop %ebp
	ret
	

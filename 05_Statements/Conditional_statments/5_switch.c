#include<stdio.h>

int main(void)
{
	int iChoice;
	
	printf("1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n");
	
	printf("Enter your choice:\t");
	scanf("%d",&iChoice );
	
	switch(iChoice)
	{
		case 1:
			printf("Addition\n");
		case 2:
			printf("Subtraction\n");
		case 3:
			printf("Multiplication\n");
		case 4:
			printf("Division\n");
		default:
			printf("Invalid choice\n");
	}
	exit(0);
} 

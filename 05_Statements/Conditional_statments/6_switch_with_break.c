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
			break;
		case 2:
			printf("Subtraction\n");
			break;
		case 3:
			printf("Multiplication\n");
			break;
		case 4:
			printf("Division\n");
			break;
		default:
			printf("Invalid choice\n");
	}
	exit(0);
} 

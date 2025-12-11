#include<stdio.h>

int main(void)
{
	int iChoice;
	
	printf("1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n");
	
	printf("Enter your choice:\t");
	scanf("%d",&iChoiceu );
	
	if(iChoice == 1)
		printf("Addition\n");
	else if(iChoice == 2)
		printf("Subtraction\n");
	else if(iChoice == 3)
		printf("Multiplication\n");
	else if(iChoice == 4)
		printf("Division\n")
	else
		printf("Invalid Choice");
	exit(0);
} 

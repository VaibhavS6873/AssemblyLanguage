#include<stdio.h>

int main(void)
{
	int iNo1;
	
	printf("Enter the number:\t");
	scanf("%d",&iNo1);
	
	if(iNo1%2 == 0)
		printf("Number is even\n");
	else
		printf("Number is odd\n");
		
	exit(0);
}

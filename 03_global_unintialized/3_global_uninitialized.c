#include<stdio.h>

int g_iNo;

int main(void)
{
	printf("Before scan:%d\n", g_iNo);
	printf("Enter number:");
	scanf("%d",&g_iNo);
	printf("After scan:%d\n",g_iNo);
	exit(0);
}

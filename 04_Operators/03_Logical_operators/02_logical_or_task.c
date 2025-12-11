#include<stdio.h>

int main(void)
{
	int iNo1, iNo2, iNo3, iAns;
	
	printf("Enter iNo1:\t");
	scanf("%d",&iNo1);	
	
	printf("Enter iNo2:\t");
	scanf("%d",&iNo2);	
	
	printf("Enter iNo3:\t");
	scanf("%d",&iNo3);
	
	iAns = iNo1 && ++iNo2 || iNo3++;
	
	printf("iNo1:%d\t\niNo2:%d\t\niNo3:%d\t\niAns:%d\t", iNo1,iNo2,iNo3,iAns);
	exit(0);		
}

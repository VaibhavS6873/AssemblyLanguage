#include<stdio.h>
#include<string.h>
int main()
{
	char str[20],ch;
	printf("\n\nEnter The String:\t");
	gets(str);
	printf("\n\nEnter The Character To Set:\t");
	scanf("%c",&ch);
	myStrset(str,ch);
	printf("\n\nNow String Is:\t");
	puts(str);
	return 0;
}

void myStrset(char* str, char ch)
{
	int iCnt = 0;
	while(str[iCnt] !='\0')
	{	
		str[iCnt] = ch;
		iCnt++;
	}
}

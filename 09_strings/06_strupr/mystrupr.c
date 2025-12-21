#include<stdio.h>
#include<string.h>
int main()
{
	char str[20];
	printf("\n\nEnter The String:\t");
	gets(str);
	myStrupr(str);
	printf("\nString In Upper Case Is:\t");
	puts(str);
	return 0;
}

void myStrupr(char* str)
{
	int iCnt = 0;
	while(str[iCnt] != '\0')
	{
		if(str[iCnt] >= 'a' && str[iCnt] <= 'z')
		{
			str[iCnt] = str[iCnt] - 32;
		}
		iCnt++;
	}
}

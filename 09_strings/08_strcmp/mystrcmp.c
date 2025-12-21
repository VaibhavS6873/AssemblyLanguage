#include<stdio.h>
#include<string.h>

int main()
{
	char string1[20],string2[20];
	int ch;
	printf("\n\nEnter String1:\t");
	gets(string1);
	printf("\n\nEnter String2:\t");
	gets(string2);
	ch=myStrcmp(string1,string2);
	if(ch==0)
	printf("\n\nBoth Strings Are Same\n");
	else
	printf("\n\nBoth Strings Are Diffrent\n");
	getchar(); //getch is not available as a c-library function
	return 0;
}

int myStrcmp(const char* str1, const char* str2)
{
	int iCnt = 0;
	
	while(str1[iCnt] != '\0' && str2[iCnt] != '\0')
	{
		if( str1[iCnt] != str2[iCnt] )
		{
			return (unsigned char)str1[iCnt] - (unsigned char)str2[iCnt];
		}
		iCnt++;
	}
	
	return (unsigned char)str1[iCnt] - (unsigned char)str2[iCnt];
}

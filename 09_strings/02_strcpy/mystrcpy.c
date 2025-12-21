#include<stdio.h>
#include<string.h>

int main()
{
	char source[20];
	char destination[20];
	printf("\n\nEnter Source String:\t");
	gets(source);
	printf("\n\nSource String Is:\t");
	puts(source);
	myStrcpy(destination,source);
	printf("\n\nDestination String Is:\t");
	puts(destination);
	return 0;
}

void myStrcpy(char* dest, const char* src)
{
	int iCnt = 0;
	while(src[iCnt]!='\0')
	{
		dest[iCnt] = src[iCnt];
		iCnt++;
 	}
 	dest[iCnt] = '\0';
}

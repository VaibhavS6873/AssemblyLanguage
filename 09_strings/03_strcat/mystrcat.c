#include<stdio.h>
#include<string.h>

int main()
{
	char source[20],destination[40];
	printf("\n\nEnter Destination String:\t");
	gets(destination);
	printf("\n\nEnter Source String:\t");
	gets(source);
	myStrcat(destination,source);
	printf("\n\nConcatenated String Is:\t");
	puts(destination);
	return 0;
}

void myStrcat(char* destination, const char* source)
{
	int iDest = 0, iSrc = 0;
	
	while(destination[iDest] != '\0')
	{
		iDest++;
	}
	
	while(source[iSrc] != '\0')
	{
		destination[iDest] = source[iSrc];
		iDest++;
		iSrc++;
	}
	
	destination[iDest] = '\0';
}

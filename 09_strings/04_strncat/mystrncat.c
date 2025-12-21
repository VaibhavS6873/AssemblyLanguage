#include<stdio.h>
#include<string.h>
int main()
{
	char source[20],destination[40];
	int n;
	printf("\n\nEnter Destination String:\t");
	gets(destination);
	printf("\n\nEnter Source String:\t");
	gets(source);
	printf("\n\nEnter Value Of n:\t");
	scanf("%d",&n);
	myStrncat(destination,source,n);
	printf("\n\nConcatenated String Is:\t");
	puts(destination);
	return 0;
}

void myStrncat(char* dest, const char* src, int n)
{
	int iDest = 0, iSrc = 0;
	
	while(dest[iDest] != '\0')
	{
		iDest++;
	}
	
	while(src[iSrc] != '\0' && n > 0)
	{
		dest[iDest] = src[iSrc];
		iDest++;
		iSrc++;
		n--;
	}
	
	dest[iDest] = '\0';
}

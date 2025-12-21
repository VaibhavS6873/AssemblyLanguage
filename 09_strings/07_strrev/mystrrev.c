#include<stdio.h>

int main()
{
	char string[20];
	printf("\n\nEnter The String:\t");
	gets(string);
	myStrrev(string);
	printf("\n\nReverse String Is:\t");
	puts(string);
	return 0;
}

void myStrrev(char* str)
{
	int len = 0;
	int start = 0;
	while(str[len] != '\0')
	{
		len++;
	}
	
	len--;
	
	while(start < len)
	{
		char temp = str[start];
		str[start] = str[len];
		str[len] = temp;
		start++;
		len--;
	}
}

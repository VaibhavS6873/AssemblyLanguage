#include<stdio.h>

int main(void)
{
	char *ptr = "Hello";
	char  str[]= "Good";
	
	printf("\nThe Length Of Hello Is %d\n",myStrlen(ptr));
	printf("The Length of Good Is %d\n",myStrlen(str));
	printf("The Length Of Morning Is %d\n",myStrlen("Morning"));
	
	return 0;
}

int myStrlen(const char* str)
{
	int length = 0;
	while(str[length]!='\0')
	{
		++length;
	}
	return length;
}

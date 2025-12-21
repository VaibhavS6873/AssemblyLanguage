#include<stdio.h>
#include<string.h>

char* myStrstr(const char* str1,const char* str2);

int main()
{
	char string1[20],string2[20],*ptr;
	printf("\n\nEnter The String:\t");
	gets(string1);
	printf("\n\nEnter String To Be Found:\t");
	gets(string2);
	ptr=myStrstr(string1,string2);
	if(ptr==NULL)
	{
		puts("\n\nString Not Found\n");
	}
	else
	{
		printf("\n\nString Is Found At %d Location\n",(ptr-string1)+1);
		printf("\n\nString Found In '%s'\n",ptr);
	}
	return 0;
}

char* myStrstr(const char* str1, const char* str2)
{	
	int i , j;
	
	if(str2[0] == '\0')
	{
		return (char*)str1;
	}
	
	for(i = 0; str1[i] != '\0'; ++i)
	{
		j = 0;
		while(str2[j] != '\0' && str1[i+j] == str2[j])
		{
				j++;
		}
		
		if(str2[j] == '\0')
		{
			return (char*)&str1[i];
		}
	}
	
	return NULL;
}

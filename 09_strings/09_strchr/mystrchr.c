#include<stdio.h>
#include<string.h>

char* myStrchr(const char* str, char ch);

int main()
{
	char str[20],ch;
	char *ptr;
	printf("\n\nEnter The String:\t");
	gets(str);
	printf("\n\nEnter Character To Be Found:\t");
	scanf("%c",&ch);
	ptr=myStrchr(str,ch);
	if(ptr==NULL)
		printf("\n\nCharacter Is Not Found\n");
	else
		printf("\n\nCharacter Is Found At %d Location\n",(ptr-str)+1);
	return 0;
}

char* myStrchr(const char* str, char ch)
{
	int iCnt = 0;
	
	while(str[iCnt] != '\0')
	{
		if(str[iCnt] == ch)
		{
			return &str[iCnt];
		}
		iCnt++;
	}
	
	return NULL;
}

#include<stdio.h>
#include<string.h>

int main()
{
	FILE *fp = NULL;
	char szText[50];
	
	fp = fopen("keyboard_to_file.txt","w");
	
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}
	
	printf("\nEnter strings:\n");
	while(strlen(gets(szText)) > 0)
	{
		fputs(szText, fp);
		fputs("\n",fp);
	}
	
	fclose(fp);
	fp = NULL;
	
	return 0;
}

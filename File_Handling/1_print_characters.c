#include<stdio.h>

int main()
{
	FILE *fp = NULL;
	char chChar;
	
	fp = fopen("print_characters.txt","r");
	
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}
	
	while(1)
	{
		if((chChar = fgetc(fp)) == EOF)
			break;
		else
			printf("%c", chChar); 
	}
	
	fclose(fp);
	fp = NULL;
	
	return 0;
}

#include<stdio.h>

int main()
{
	FILE* fp = NULL;
	char szText[50];
	
	fp = fopen("file_to_screen.txt","r");
	
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}
	
	while(fgets(szText, 49, fp) != NULL)
		printf("%s",szText);
		
	fclose(fp);
	fp = NULL;
	
	return 0;
}
